require 'customer_order'

describe CustomerOrder do

  let(:orderlist) { described_class.new }
  let(:dish_1) { double :dish, name: 'Fruit Basket', price: 10.99 }
  let(:dish_2) { double :dish, name: 'Eggs Bennedict', price: 11.99 }

  it 'can have orders added to it' do
    expect(orderlist.add(dish_1)).to eq [dish_1]
  end

  it 'prints orders' do
    orderlist.add(dish_1)
    orderlist.add(dish_2)
    expect(orderlist.show_contents).to eq [dish_1, dish_2]
  end

  it 'processes orders' do
    orderlist.add(dish_1)
    orderlist.add(dish_2, dish_2)
    expect(orderlist.process).to eq "Dish: #{dish_1.name} Price: #{dish_1.price}, Quantity: 1\nDish: #{dish_2.name} Price: #{dish_2.price}, Quantity: 2\n"
  end

end
