require 'order'
describe Order do
  it 'can make an order' do
    order = Order.new
    expect(order).to be_a_kind_of(Order)
  end

  it 'can select number of several dishes' do
    order = Order.new
    menu = Menu.new
  expect(order.select("Sushi",3)).to eq([{:dish=>"Sushi", :price=>7.0, :quantity=>3}])
  end

  it 'gives the total matches with the sum of various dishes in my order' do
    order = Order.new
    menu = Menu.new
    order.select("Sushi",2)
    order.select("Teriyaki",3)
    expect(order.total).to eq(27.5)
  end

  it 'can raise error if the total is not correct' do
  order = Order.new
  order.select("Teriyaki",1)
  order.select("Pho",1)
  mock_order = double(:mock_order)
  allow(mock_order).to receive(:total).and_return(10)
  expect{ order.done(mock_order) }.to raise_error("Total is not correct!")
end

  it 'can give you a confirmation when amount is correct' do
    order = Order.new
    order.select("Teriyaki",2)
    order.select("Pho",1)
    mock_order = double(:mock_order)
    allow(mock_order).to receive(:total).and_return(15.00)
    expect{ order.done(mock_order) }.to output("Thank you! Your order was placed and will be delivered before 18:52").to_stdout
end

end
