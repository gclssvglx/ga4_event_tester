# frozen_string_literal: true

RSpec.describe "Tester" do
  let(:tester) { Ga4EventTester::Tester.new("integration") }

  context "when it tests all events in integration" do
    it "completes successfully" do
      expect(tester.test).to eq(nil)
    end
  end
end
