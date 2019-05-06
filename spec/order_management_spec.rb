require 'order_management'
require 'food_menu'

describe OrderManagement do
  subject(:order_management) { OrderManagement.new(food_menu) }
  let(:food_menu) { double :FoodMenu, print: multiple_dishes }
  let(:multiple_dishes) { { naan: 0.90, penang_curry: 5.00 } }

  let(:selected_dishes) { { naan: 2, penang_curry: 2 } }

  context '#add_to_order' do

    it 'has the `add_to_order` method to collect and store the orders against selected_dishes' do
      allow(food_menu).to receive(:we_serve?).with(:naan).and_return(true)
      allow(food_menu).to receive(:we_serve?).with(:penang_curry).and_return(true)
      order_management.add_to_order(:naan, 2)
      order_management.add_to_order(:penang_curry, 2)
      expect(order_management.selected_dishes).to eq(selected_dishes)
    end

    it 'raises an error if dish requested is not on the FoodMenu' do
      allow(food_menu).to receive(:we_serve?).with(:green_curry).and_return(false)
      expect { order_management.add_to_order(:green_curry, 1) }.to raise_error("We don't serve this dish! Sorry :(")
    end

  end

  context '#sum_total' do

    it 'has `sum_total` method to determine the total of the order' do
      allow(food_menu).to receive(:we_serve?).with(:naan).and_return(true)
      allow(food_menu).to receive(:we_serve?).with(:penang_curry).and_return(true)
      order_management.add_to_order(:naan, 2)
      order_management.add_to_order(:penang_curry, 2)
      allow(food_menu).to receive(:price).with(:naan).and_return(0.90)
      allow(food_menu).to receive(:price).with(:penang_curry).and_return(5.00)
      expected_total = 11.80
      expect(order_management.sum_total).to eq(expected_total)
    end

  end

end
