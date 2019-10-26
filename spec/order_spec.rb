require 'order'

describe Order do
  subject(:order) { Order.new }
  dish = Dish.new("chow mien", "10.00", true)
  dish_2 = Dish.new("kung po", "15.00", true)
  let(:not_a_dish) { double :object }

  describe '#add_order_line' do

    it 'add 1 dish, quantity of 1' do
      expect(order.add_order_line(dish, 1)).to eq [{ dish: "chow mien", price: "10.00", quantity: 1, line_total: 10 }]
    end

    it 'add 1 dish, quantity greater than 1' do
      expect(order.add_order_line(dish, 3)).to eq [{ dish: "chow mien", price: "10.00", quantity: 3, line_total: 30 }]
    end

    it ' error if called without a dish object' do
      expect { order.add_order_line(not_a_dish, 1) }.to raise_error(RuntimeError, "not a dish")
    end

    it 'error if quantity passed less than 1' do
      expect { order.add_order_line(dish, 0) }.to raise_error(RuntimeError, "quantity less than 1 not allowed")
    end

    it 'multiple order lines added' do
      #test setup additional order line and result
      order.add_order_line(dish, 1)
      result = [
        { dish: "chow mien", price: "10.00", quantity: 1, line_total: 10.00 },
        { dish: "kung po", price: "15.00", quantity: 3, line_total: 45.00 }
      ]

      #run 2nd line add and assert against result
      expect(order.add_order_line(dish_2, 3)).to eq result
    end

    
  end
end
