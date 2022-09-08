# frozen_string_literal: true

require "logger"
require "webdrivers"
require_relative "config"

module Ga4EventTester
  class Tester
    attr_reader :driver, :environment, :run_log

    def initialize(environment)
      FileUtils.mkpath "logs"
      @run_log = Logger.new("logs/#{environment}.log", "weekly")
      @environment = environment

      create_driver
      accept_all_cookies
    end

    def test
      success_count = 0
      failure_count = 0

      Ga4EventTester::Config.urls.each do |url|
        url = environment_url(url)
        driver.get url
        click_everything

        driver.execute_script("return dataLayer").each do |event|
          next unless event.is_a?(Hash) && Ga4EventTester::Config.events.include?(event["event"])

          result = check_event(event)
          result.empty? ? success_count += 1 : failure_count += 1
          result.empty? ? print(".") : print("F")
          run_log.debug({ ok: result.empty?, result: result, url: url, event: event }.to_json)
        end
      end

      puts("\n\nSuccess [#{success_count}] Failures [#{failure_count}] Total [#{success_count + failure_count}]\n\n")

      run_log.close
    end

  private

    def create_driver
      @driver = Selenium::WebDriver.for(
        :chrome,
        capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
          "goog:chromeOptions": {
            args: ["headless", "disable-gpu", "user-agent=Analytics Robot"],
          },
        ),
      )
    end

    def accept_all_cookies
      driver.get environment_url("https://www.[ENVIRONMENT]gov.uk")
      driver.find_element(:xpath, "//*[@data-accept-cookies='true']").click
      driver.find_element(:xpath, "//*[@data-hide-cookie-banner='true']").click
    end

    def click_everything
      Ga4EventTester::Config.actions.each do |action|
        driver.find_elements(
          xpath: "//*[@data-track-action='#{action}']",
        ).each(&:click)
      end
    end

    def environment_url(url)
      if environment == "production"
        url.gsub("[ENVIRONMENT]", "")
      else
        url.gsub("[ENVIRONMENT]", "#{environment}.publishing.service.")
      end
    end

    def check_event(event)
      case event["event"]
      when "page_view"
        (event["page_view"].keys - Ga4EventTester::Config.page_view_keys)
      when "event_data"
        (event["event_data"].keys - Ga4EventTester::Config.event_data_keys)
      end
    end
  end
end
