require 'takeaway.rb'
require 'menu.rb'


describe Takeaway do
    subject(:takeaway)  { described_class.new(menu: menu, order: order) }

    let(:menu) { double(:menu, print: printed_menu) }
    let(:printed_menu) { "Cheesy Chips: £3" }

    let(:order) { double(:order) }
    let(:dishes) { {chips: 2, burger: 3} }

    it 'it shows a list of dishes with prices' do
      expect(takeaway.print_menu).to eq("Cheesy Chips: £3")
    end

    it "orders some number of several available dishes" do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
end