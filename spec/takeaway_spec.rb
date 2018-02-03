require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double("menu") }
  context "a customer wants to check menu with prices" do
    describe "#show_menu" do
      it "returns menu" do
        expect(menu).to receive(:show)
        takeaway.show_menu
      end
    end
  end
end
