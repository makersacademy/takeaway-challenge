require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu: menu)}
  let(:menu) {double(:menu, print_menu: dishes)}
  let(:dishes) {"Katsu chicken wrap: £4.50" }
  let(:order) { {Katsu_Chicken_Wrap: 3}}

  describe '#show_menu' do
    it 'shows the menu: name of dish and price' do
      expect(takeaway.show_menu).to eq dishes
    end
  end

  describe '#place_order(order)' do
    it 'takes an order or a certain quantity' do
      expect(takeaway.place_order(order)).to eq order
    end
  end


end
