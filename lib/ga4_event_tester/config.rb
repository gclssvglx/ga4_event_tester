# frozen_string_literal: true

module Ga4EventTester
  class Config
    class << self
      def urls
        [
          "https://www.[ENVIRONMENT]gov.uk",
          "https://www.[ENVIRONMENT]gov.uk/bank-holidays",
          "https://www.[ENVIRONMENT]gov.uk/coronavirus",
          "https://www.[ENVIRONMENT]gov.uk/cost-of-living",
          "https://www.[ENVIRONMENT]gov.uk/find-a-job",
          "https://www.[ENVIRONMENT]gov.uk/hmrc-internal-manuals/employment-income-manual/updates",
          "https://www.[ENVIRONMENT]gov.uk/renew-driving-licence",
          "https://www.[ENVIRONMENT]gov.uk/world/afghanistan",
          "https://www.[ENVIRONMENT]gov.uk/government/news/7-new-community-diagnostic-centres-to-offer-more-patients-life-saving-checks",
          "https://www.[ENVIRONMENT]gov.uk/government/organisations/cabinet-office",
          "https://www.[ENVIRONMENT]gov.uk/guidance/understanding-your-driving-test-result/car-driving-test",
          "https://www.[ENVIRONMENT]gov.uk/service-manual/agile-delivery",
          "https://www.[ENVIRONMENT]gov.uk/service-manual/helping-people-to-use-your-service",
          "https://www.[ENVIRONMENT]gov.uk/service-manual/technology",
          "https://www.[ENVIRONMENT]gov.uk/service-manual/user-research",
          "https://www.[ENVIRONMENT]gov.uk/guidance/immigration-rules/immigration-rules-appendix-skilled-occupations",
          "https://www.[ENVIRONMENT]gov.uk/guidance/mot-inspection-manual-for-private-passenger-and-light-commercial-vehicles/4-lamps-reflectors-and-electrical-equipment",
          "https://www.[ENVIRONMENT]gov.uk/guidance/mot-inspection-manual-for-private-passenger-and-light-commercial-vehicles/5-axles-wheels-tyres-and-suspension",
          "https://www.[ENVIRONMENT]gov.uk/guidance/the-highway-code/traffic-signs",
          "https://www.[ENVIRONMENT]gov.uk/guidance/the-highway-code/general-rules-techniques-and-advice-for-all-drivers-and-riders-103-to-158",
          "https://www.[ENVIRONMENT]gov.uk/guidance/understanding-your-driving-test-result/car-driving-test",
        ]
      end

      def actions
        [
          "accordionOpened",
          "accordionClosed",
          "tab",
          "facebook",
          "twitter",
          "instagram",
          "linkedin",
          "youtube",
          "flickr",
          # "ffNoClick",
          # "ffYesClick",
          # "ffMaybeClick",
          # "ffFormClose",
          # "logoLink",
          # "topicsLink",
          # "governmentactivityLink",
          # "searchSubmitted",
          # "popularLink",
          # "homeBreadcrumb",
          # "skip-Link",
          # "level_one_taxon",
          # "Content type",
          # "mobile-filter-button",
          # "clicked",
          # "Search.1",
          # "Search.2",
          # "Search.2.1",
          # "Search.2.2",
          # "Search.2.3",
          # "Search.2.4",
          # "Search.2.5",
          # "Search.3",
          # "Search.4",
          # "Search.5",
          # "Search.6",
          # "Search.7",
          # "Search.8",
          # "Search.9",
          # "Search.10",
          # "next",
          # "GOV-UK Open Form",
          # "GOV-UK Send Form",
          # "GOV-UK Close Form",
          # "Send Form",
          # "supportLink",
          # "copyrightLink",
          # "Cookie banner accepted",
          # "Cookie banner rejected",
          # "Cookie banner settings clicked from confirmation",
          # "Hide cookie banner",
        ]
      end

      def events
        %w[
          page_view
          event_data
        ]
      end

      def page_view_keys
        %w[
          content_id
          document_type
          first_published_at
          history
          language
          location
          organisations
          political_status
          primary_publishing_organisation
          public_updated_at
          publishing_app
          publishing_government
          referrer
          rendering_app
          schema_name
          section
          status_code
          taxon_id
          taxon_ids
          taxon_slug
          taxon_slugs
          themes
          title
          updated_at
          withdrawn
          world_locations
        ]
      end

      def event_data_keys
        %w[
          action
          event_name
          external
          index
          index_total
          link_method
          section
          text
          type
          url
        ]
      end
    end
  end
end
