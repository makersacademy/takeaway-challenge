require 'order'

describe Order do

  it 'should respond to the method check' do
    expect( subject ).to respond_to(:check)
  end

  it 'should return the number of items in order when calling method check' do
    takeaway = Menu.new
    order = takeaway.select_dishes('Spaghetti Carbonara', 'Calzone')
    expect( order.check ).to eq(2)
  end

end
