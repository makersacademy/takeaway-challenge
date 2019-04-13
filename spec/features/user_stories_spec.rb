describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customers can check dishes, return list of dishes with prices' do
    dishes = Dishes.new
    expect(dishes.prices).to be_an_instance_of(Array)
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so customers can order dishes, recieve list of quantities' do
    quantity = '0,0,0,0,1,0,0,0'
    order = Order.new
    expect { order.select(quantity) }.not_to raise_error
  end
end
