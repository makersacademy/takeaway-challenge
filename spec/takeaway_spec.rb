require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:printed_menu) { "Pepperoni £7.50"}

  describe "#view_menu" do

    it "shows a list of dishes with prices" do
      expect(takeaway.view_menu(menu)).to eq(printed_menu)
    end
  end


end
