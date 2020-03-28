require 'order'

describe Order do
  let (:stew_dish) { double(:stew, name: :stew, price: 2.99) }
  let (:rice_dish) { double(:rice, name: :rice, price: 3.22) }
  let (:list_of_dishes) { double(:dish_list) }

  it 'cannot have zero selections' do
    list_of_dishes = double(:dish_list)
    expect { Order.new(list_of_dishes, {}) }.to raise_error(ArgumentError, 'order must not be empty')
  end

  it 'shows an order summary' do
    allow(list_of_dishes).to receive(:get_dish).with(:stew).and_return(stew_dish)
    allow(list_of_dishes).to receive(:get_dish).with(:rice).and_return(rice_dish)

    order = Order.new(list_of_dishes, {stew: 2, rice: 1})
    expect(order.summary).to eq({stew: {quantity: 2, price: 2.99}, rice: {quantity: 1, price: 3.22}})
  end
end