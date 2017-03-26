require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu: menu, order: order)}
  let(:menu) {double(:menu, print_menu: dishes)}
  let(:order) {double(:order)}
  let(:dishes) {"Katsu chicken wrap: £4.50" }
  let(:fake_order) { {Katsu_Chicken_Wrap: 3}}

  describe '#show_menu' do
    it 'shows the menu: name of dish and price' do
      expect(takeaway.show_menu).to eq dishes
    end
  end

  describe '#place_order(order)' do

    it 'takes an order or a certain quantity' do
      expect(order).to receive(:add)
      allow(order).to receive(:total).and_return(nil)
      takeaway.place_order(fake_order)
    end

    it 'returns total for current order upon #place_order' do
      allow(order).to receive(:add)
      allow(order).to receive(:total).and_return("Order placed: Your total is £13.50")
      expect(takeaway.place_order(fake_order)).to eq "Order placed: Your total is £13.50"
    end
  end
end
