require 'order_management'
require 'food_menu'

describe OrderManagement do
  subject(:order_management) { OrderManagement.new(food_menu) }
  let(:food_menu) { double :FoodMenu }

  let(:selected_dishes) { {fish: 2, chips: 2} }

    it 'has the `add_to_order` method to collect and store the orders against selected_dishes' do
      order_management.add_to_order(:fish, 2)
      order_management.add_to_order(:chips, 2)
      expect(order_management.selected_dishes).to eq(selected_dishes)
    end



end

