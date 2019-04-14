require 'order'

RSpec.describe Order do
  let(:order) {described_class.new(menu)}
  let(:menu) {double :Menu, :dishes => dish_on_menu}

  let(:dish_on_menu) do
    {
        kenkey: 2.49,
        waakye: 3.99
    }
  end

  describe '#user_order' do
    it 'adds user choice to users order' do
      order.user_choice(:kenkey, 2.49)
      order.user_choice(:waakye, 3.99)
      expect(order.users_order).to eq(dish_on_menu)
    end
  end

  describe '#user_choice' do
    it 'raises error if user choice not in menu' do
      expect { order.user_choice(:pizza,3) }.to raise_error 'choice not found'
    end
  end

  describe '#order_total' do
    it 'calculates the total order' do
      dish = :kenkey
      quantity = 2
      total = 4.98
      message = "Your total order is currently £%.2f" % [total]
      expect(order.total_order(dish, quantity)).to eq(message)
    end
  end
end