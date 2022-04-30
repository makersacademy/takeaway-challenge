require 'order'

describe Order do

  subject(:order) {Order.new}
  let(:dish) { {id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true} }
  let(:menu) {instance_double('Menu')}
  
  it 'creates an instance of the order class' do
    expect(order).to be_instance_of(Order)
  end

  it 'initializes with the order variable' do
    expect(order.current_order).to eq([])
  end

  it 'adds a dish to the current_order' do
    allow(menu).to receive(:select_dish).and_return(dish)
    order.add_dish(1, 1)
    expect(order.current_order).to eq([{:dish => dish, :quantity => 1}])
  end

  it 'updates the quantity if the same dish is added twice' do
    allow(menu).to receive(:select_dish).and_return(dish)
    order.add_dish(1, 1)
    order.add_dish(1, 1)
    expect(order.current_order).to eq([{:dish => dish, :quantity =>2}])
  end

  it 'removes the dish from the current order' do
    allow(menu).to receive(:select_dish).and_return(dish)
    order.add_dish(1, 1)
    order.remove_dish(1)
    expect(order.current_order).to eq([])
  end
  
  it 'raises an erro when removing dish that has not been added' do
    expect {order.remove_dish(1)}.to raise_error 'Dish has not been added'
  end

  it 'removes the dish from the current order if the quantity is zero' do
    allow(menu).to receive(:select_dish).and_return(dish)
    order.add_dish(1, 1)
    order.update_dish_quantity(1, 0)
    expect(order.current_order).to eq([])
  end

  it 'calculates total for the current order' do
    allow(menu).to receive(:select_dish).and_return(dish)
    order.add_dish(1, 1)
    order.add_dish(1, 1)
    expect(order.total).to eq 14
  end

end