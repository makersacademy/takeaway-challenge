require 'takeaway'
require 'food_menu'
require 'twilio_message'

describe Takeaway do

  subject(:chinese_takeaway) { Takeaway.new(chinese_food, order_management_1) }
  let(:chinese_food) { double :FoodMenu, print: chicken }
  let(:chicken) { { sweet_and_sour_chicken: 5.00 } }
  let(:order_management_1) { double :OrderManagement }

  subject(:indian_takeaway) { Takeaway.new(indian_food, order_management_2) }
  let(:indian_food) { double :FoodMenu, print: multiple_dishes }
  let(:multiple_dishes) { { naan: 0.90, penang_curry: 5.00, spare_ribs: 6.00 } }
  let(:order_management_2) { double :OrderManagement }

  let(:selected_dishes) { { fish: 1, chips: 3 } }

  let(:message) { double :Message }

  context '#see_dishes' do

    it '`see_dishes` method outputs a dish' do
      expect(chinese_takeaway.see_dishes).to eq(chicken)
    end

    it '`see_dishes` method outputs multiple dishes' do
      expect(indian_takeaway.see_dishes).to eq(multiple_dishes)
    end

  end

  context '#place_the_order' do

    it 'customer places `place_the_order` at the takeaway for a select number of dishes' do
      allow(order_management_2).to receive(:add_to_order)
      allow(order_management_2).to receive(:sum_total)
      indian_takeaway.place_the_order(selected_dishes)
    end

    # it 'sends a text message to the customer once customer has placed the order' do
    # end

  end

end
