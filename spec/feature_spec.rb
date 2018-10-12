require 'dish'
# require 'menu'
require 'order'


describe 'placing an order' do

  before(:each) do
    @pizza = Dish.new(name: 'Pizza', price: 7.45)
    @pasta = Dish.new(name: 'Pasta', price: 6.40)
    @salad = Dish.new(name: 'Salad', price: 4.30)
  end

  it 'should send text' do
    order = Order.new(dishes: { @pizza => 1, @pasta => 1, @salad => 1 }, bill: 18.15 )
    allow(order).to receive(:send_text)
    order.check_bill
    expect(order).to have_received(:send_text)
  end
  it 'should raise error' do
    order = Order.new(dishes: { @pizza => 1, @pasta => 1, @salad => 1 }, bill: 18.14 )
    expect { order.check_bill }.to raise_error('Incorrect Bill')
  end
end
