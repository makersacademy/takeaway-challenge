require 'order'
describe Order do
  it 'can make an order' do
    order = Order.new
    expect(order).to be_a_kind_of(Order)
  end

  it 'can select number of several dishes' do
    order = Order.new
    menu = Menu.new
  expect(order.select("Sushi",3)).to eq([{:dish=>"Sushi", :price=>7.0, :quantilty=>3}])
  end

  it 'gives the total matches with the sum of various dishes in my order' do
    order = Order.new
    menu = Menu.new
    order.select("Sushi",2)
    order.select("Teriyaki",3)
    expect(order.total).to eq(27.5)
  end 
end
