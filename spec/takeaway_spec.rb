require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe "#show_menu" do
    context "when called" do
      it "calls menu.print" do
        expect(takeaway.menu).to receive(:print_menu)
        takeaway.show_menu
      end
    end
  end

  it { is_expected.to respond_to(:order).with(2).argument}

end
