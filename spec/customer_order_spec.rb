require 'customer_order'

describe CustomerOrder do

  let(:customer_order) { described_class.new }
  let(:dish_1) { double :dish, name: 'Fruit Basket', price: 10.99 }
  let(:dish_2) { double :dish, name: 'Eggs Bennedict', price: 11.99 }

  it 'can have orders added to it' do
    expect(customer_order.add(dish_1)).to eq [dish_1]
  end

  it 'can have orders removed from it' do
    customer_order.add(dish_1)
    expect { customer_order.remove(dish_1) }.to change{customer_order.order_count}.from(1).to(0)
  end

  it 'cannot remove dishes that it does not contain' do
    message = "That dish is not in this order"
    expect { customer_order.remove(dish_1) }.to raise_error "That dish is not in this order"
  end

  it 'displays its contents' do
    customer_order.add(dish_1)
    customer_order.add(dish_2)
    expect(customer_order.show_contents).to eq [dish_1, dish_2]
  end

end
