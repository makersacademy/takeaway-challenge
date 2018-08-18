require 'takeaway'

describe Takeaway do

  describe "#view_menu" do

    let(:takeaway) { described_class.new(menu: menu) }
    let(:menu) { double(:menu, print_menu: printed_menu) }
    let(:printed_menu) { "Pizza: £7.50" }

    it "allows us to view a menu" do
      expect(takeaway.view_menu).to eq(printed_menu)
    end
  end
end
