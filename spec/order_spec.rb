require 'order'

describe Order do
  # passing Object here to allow dishes to be mocked
  subject(:order) { Order.new(Object) }
  let(:dish) { double :dish }
  let(:dish_2) { double :dish }
  let(:not_a_dish) { double :object }
  let(:sender) { double :textSender }
  let(:sender_class) { double :sender_class, new: sender }

  before do (:all)
    # set up stub responses before all tests are run
    allow(dish).to receive(:name).and_return("chow mien")
    allow(dish).to receive(:price).and_return("10.00")
    allow(dish_2).to receive(:name).and_return("kung po")
    allow(dish_2).to receive(:price).and_return("15.00")
  end

  describe '#add_order_line' do
    it 'add 1 dish, quantity of 1' do
      expect(order.add_order_line(dish, 1)).to eq [
        { dish: "chow mien", price: "10.00", quantity: 1, line_total: 10 }]
    end

    it 'add 1 dish, quantity greater than 1' do
      expect(order.add_order_line(dish, 3)).to eq [
      { dish: "chow mien", price: "10.00", quantity: 3, line_total: 30 }]
    end

    it ' error if called without a dish object' do
      order_without_di = Order.new
      expect { order_without_di.add_order_line(not_a_dish, 1) }.to raise_error(RuntimeError, "not a dish")
    end

    it 'error if quantity passed less than 1' do
      expect { order.add_order_line(dish, 0) }.to raise_error(RuntimeError, "quantity less than 1 not allowed")
    end

    it 'multiple order lines added' do
      # test setup additional order line and result
      order.add_order_line(dish, 1)
      result = [
        { dish: "chow mien", price: "10.00", quantity: 1, line_total: 10.00 },
        { dish: "kung po", price: "15.00", quantity: 3, line_total: 45.00 }
      ]

      # run 2nd line add and assert against result
      expect(order.add_order_line(dish_2, 3)).to eq result
    end
  end

  describe '#calculate_total' do

    it 'empty order returns zero' do
      expect(order.calculate_total).to eq 0
    end

    it 'returns line total for order with 1 order line' do
      order.add_order_line(dish, 1)
      expect(order.calculate_total).to eq 10
    end

    it 'returns sum of line totals for orders with multiple lines' do
      order.add_order_line(dish, 1)
      order.add_order_line(dish_2, 3)
      expect(order.calculate_total).to eq 55.00
    end
  end

  describe "#submit_order" do
    before do
      allow(sender).to receive(:send)
    end

    it 'empty order returns an error' do
      expect { order.submit_order }.to raise_error(RuntimeError, "Can't submit an empty order")
    end

    it 'order with lines submits confirmation text' do
      order.add_order_line(dish, 1)
      order.add_order_line(dish_2, 3)
      expect(order.submit_order(sender_class)).to eq "Order Confirmed"
    end
  end
end
