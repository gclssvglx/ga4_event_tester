# frozen_string_literal: true

require_relative "lib/ga4_event_tester/version"

Gem::Specification.new do |spec|
  spec.name = "ga4_event_tester"
  spec.version = Ga4EventTester::VERSION
  spec.authors = ["Government Digital Service"]
  spec.email = ["govuk-dev@digital.cabinet-office.gov.uk"]

  spec.summary = "Google Analytics 4 (GA4) Event Tester GOV.UK"
  spec.description = "Tool for testing GA4 events"
  spec.homepage = "https://github.com/alphagov/ga4_event_tester"
  spec.license = "MIT"

  spec.required_ruby_version = File.read(".ruby-version").chomp

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.add_dependency "selenium-webdriver"
  spec.add_dependency "webdrivers"

  spec.add_development_dependency "rubocop-govuk"
  spec.add_development_dependency "simplecov"
end
