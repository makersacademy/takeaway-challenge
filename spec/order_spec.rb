require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish, name: "fried chicken", price: 7.5, quantity: 2, total_price: 10.25 }
  let(:other_dish) { double :other_dish, name: "fresh salad", price: 2.75 }

  it { expect(order).to respond_to :add_dish }
  it { expect(order).to respond_to :finalize_order }
  it { expect(order).to respond_to :display_order }

  it 'allows to add dish to order list' do
    expect(order.add_dish(:dish, 2)).to eq 2
  end

  it 'allows to display the ordered dishes' do
    order.add_dish(:dish)
    order.add_dish(:other_dish)
    expect(order.display_order).to (include { :dish })
  end

  it 'allows to finalize an order by calculating the order total' do
    dish1 = Dish.new("chicken", 7.5)
    dish2 = Dish.new("salad", 2.5)
    order.add_dish(dish1)
    order.add_dish(dish2, 2)
    expect(order.finalize_order(12.5)).to eq 12.5
  end

  it 'raise error if price not matching total order amount' do
    error = "Please confirm your order price!"
    expect { order.finalize_order(5) }.to raise_error(error)
  end

end
