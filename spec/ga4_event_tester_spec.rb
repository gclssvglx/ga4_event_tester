# frozen_string_literal: true

RSpec.describe Ga4EventTester do
  describe "version number" do
    it "has a version number" do
      expect(Ga4EventTester::VERSION).not_to be nil
    end
  end

  describe "TestEvents" do
    let(:tester) do
      Ga4EventTester::TestEvents.new("integration", "data/test_interactions.yml")
    end

    context "when it has a webdriver" do
      it "is valid" do
        expect(tester.driver).to respond_to(:get).with(1).argument
      end
    end

    context "when it tries to get_url" do
      it "gets the right page" do
        tester.get_url("https://www.[ENVIRONMENT].publishing.service.gov.uk")

        expect(tester.driver.page_source.include?("Welcome to GOV.UK")).to be true
      end
    end

    context "when it creates an event_data event" do
      it "includes all the required attributes" do
        expected = {
          "event" => "event_data",
          "event_data" => {
            "action" => "Fred Flintstone",
            "event_name" => "Break rocks",
            "external" => nil,
            "index" => nil,
            "index_total" => nil,
            "link_method" => nil,
            "section" => nil,
            "text" => nil,
            "type" => nil,
            "url" => nil,
          },
        }

        data_attributes = {
          "action" => "Fred Flintstone",
          "event_name" => "Break rocks",
        }

        expect(tester.create_event_data(data_attributes)).to eq(expected)
      end
    end

    context "when it creates a page_view event" do
      it "includes all the required attributes" do
        expected = {
          "event" => "page_view",
          "page_view" => {
            "content_id" => "BEDROCK-001",
            "document_type" => "Slate newsletter",
            "first_published_at" => nil,
            "history" => nil,
            "language" => nil,
            "location" => nil,
            "organisations" => nil,
            "political_status" => nil,
            "primary_publishing_organisation" => nil,
            "public_updated_at" => nil,
            "publishing_app" => nil,
            "publishing_government" => nil,
            "referrer" => nil,
            "rendering_app" => nil,
            "schema_name" => nil,
            "section" => nil,
            "status_code" => nil,
            "taxon_id" => nil,
            "taxon_ids" => nil,
            "taxon_slug" => nil,
            "taxon_slugs" => nil,
            "themes" => nil,
            "title" => nil,
            "updated_at" => nil,
            "withdrawn" => nil,
            "world_locations" => nil,
          },
        }

        data_attributes = {
          "content_id" => "BEDROCK-001",
          "document_type" => "Slate newsletter",
        }

        expect(tester.create_page_view_data(data_attributes)).to eq(expected)
      end
    end

    context "when checking the actual event against the expected event" do
      it "does not raise an exception if they match" do
        actual = { one: 1, two: 2 }
        expected = { one: 1, two: 2 }

        expect { tester.test_result(actual, expected) }.not_to raise_error
      end

      it "does raise an exception if they do not match" do
        actual = { one: 1, two: 2 }
        expected = { one: 1 }

        expect { tester.test_result(actual, expected) }.to raise_error(Ga4EventTester::Error)
      end
    end

    context "when comparing two hashes" do
      it "returns nothing when they are the same" do
        expect(tester.diff_events({}, {})).to eq({})
      end

      it "returns the left-hand-side" do
        expect(tester.diff_events({ one: 1 }, {})).to eq({ one: 1 })
      end

      it "returns the right-hand-side" do
        expect(tester.diff_events({}, { one: 1 })).to eq({ one: 1 })
      end
    end

    context "when it runs the tests" do
      it "calls the test_tab_events method" do
        expect(tester).to receive(:test_tab_events).with(%w[govuk-tabs__tab])
        tester.run
      end

      it "calls the test_accordion_events method" do
        expect(tester).to receive(:test_accordion_events).with(%w[govuk-accordion__show-all govuk-accordion__section-heading])
        tester.run
      end

      it "calls the test_pageview_events method" do
        expect(tester).to receive(:test_pageview_events)
        tester.run
      end
    end
  end
end
