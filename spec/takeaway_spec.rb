require 'takeaway.rb'
require 'menu.rb'
require 'order.rb'

describe Takeaway do
    subject(:takeaway)  { described_class.new(menu: menu, order: order) }

    let(:menu) { double(:menu, print: printed_menu) }
    let(:printed_menu) { "Cheesy Chips: £3" }

    let(:order) { instance_double("Order", total: 20) }

    let(:dishes) { {chips: 2, burger: 2} }

    before do
      allow(order).to receive(:add)
    end

    it 'it shows a list of dishes with prices' do
      expect(takeaway.print_menu).to eq("Cheesy Chips: £3")
    end

    it "orders some number of several available dishes" do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end

    it "knows the order total" do
        total = takeaway.place_order(dishes)
        expect(total).to eq(20)
      end


end