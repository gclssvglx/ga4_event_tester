# frozen_string_literal: true

RSpec.describe "VERSION" do
  describe "version number" do
    it "has a version number" do
      expect(Ga4EventTester::VERSION).not_to be nil
    end
  end
end
