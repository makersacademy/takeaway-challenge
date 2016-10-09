require 'order'

describe Order do

  before do
    @quantity = 2
    @cost = 10.50
    @test_number = 5
    @price = 5.95
    @name = "Margherita"
  end

  let(:dish) { double("Dish", name: @name, price: @price) }
  let(:order_line) { double("OrderLine", dish: dish, quantity: @quantity, cost: @cost) }

  subject(:order) {described_class.new}

  it 'should store order lines' do
    order.add(order_line)
    expect(order.order_array[0].dish).to eq dish
  end

  it 'should keep track of total dishes' do
    @test_number.times {order.add(order_line)}
    expect(order.dish_qty).to eq (@quantity * @test_number)
  end

  it 'should calculate cost' do
    @test_number.times {order.add(order_line)}
    expect(order.total_cost).to eq (@cost * @test_number)
  end

  it 'should add to order display array' do
    order.add(order_line)
    expect(order.order_display).to eq ["Dish:  Margherita  Quantity:  2"]
  end

end
