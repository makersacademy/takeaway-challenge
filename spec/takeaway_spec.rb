require './lib/takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

    let(:menu) { double(:menu, print: printed_menu)}
    let(:order) {double(:order)}
    let(:printed_menu) { double("2 Eggs: £2")}

    let(:dishes) { {Egg: 1, Eggs: 2} }

    it "prints the menu" do
      expect(takeaway.print_menu). to eq(printed_menu)
    end

    it "can order dishes" do
      allow(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end
