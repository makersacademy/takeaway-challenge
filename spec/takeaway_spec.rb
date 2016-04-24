require 'takeaway'
require 'dish'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms)}
  let(:order) { double :order, selected_dishes: [dish, dish2]}
  let(:menu) { double :menu, print_menu: printed_menu, dishes: [dish, dish2]}
  let(:printed_menu) { "Pizza: £7.99" }
  let(:dish) { Dish.new(name: "Pizza", price: 7.50) }
  let(:dish2) { Dish.new(name: "Soup", price: 3.20) }
  let(:dish1) { double :dish }
  let(:sms) { instance_double "SMS", deliver: nil }
  
  it 'shows the menu' do
    expect(takeaway.show_menu).to eq printed_menu
  end

  describe "#place_order" do

    before do
      allow(order).to receive(:total)
    end

    context "when dish not in menu" do
      it 'raises an error' do
        expect { takeaway.place_order(dish1, 4) }.to raise_error "The dish is not in the menu"
      end
    end

    context "when dish in menu" do
      it 'gives it a quatity' do
        dish.quantity = 4
        expect(takeaway.place_order(dish, 4)).to eq sms.deliver
      end
    end

    it 'sends an SMS to confirm order' do
      expect(sms).to receive(:deliver)
      takeaway.place_order(dish, 2)
    end

  end

end