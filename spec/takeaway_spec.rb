require 'takeaway'
require 'confirmation_text'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu: menu, order: order, confirmation_text: confirmation_text)}
  let(:menu) {double(:menu, print_menu: dishes)}
  let(:order) {double(:order)}
  let(:dishes) {"Katsu chicken wrap: £4.50" }
  let(:fake_order) { {Katsu_Chicken_Wrap: 3}}
  let(:confirmation_text) {double(:confirmation_text, send_text: nil)}

  before do
    allow(confirmation_text).to receive(:send_text)
  end

  describe '#show_menu' do
    it 'shows the menu: name of dish and price' do
      expect(takeaway.show_menu).to eq dishes
    end
  end

  describe '#place_order(order)' do

    it 'takes an order of a certain quantity' do
      allow(order).to receive(:total).and_return(nil)
      expect(order).to receive(:add)
      takeaway.place_order(fake_order)
    end

    it 'returns total for current order upon #place_order' do
      allow(order).to receive(:add)
      allow(order).to receive(:total).and_return("Order placed: Your total is £13.50")
      expect(takeaway.place_order(fake_order)).to eq "Order placed: Your total is £13.50"
    end

    it 'sends a confirmation text after placing an order' do
      expect(confirmation_text).to receive(:send_text)
      allow(order).to receive(:total).and_return(nil)
      allow(order).to receive(:add)
      takeaway.place_order(fake_order)
    end
  end
end
