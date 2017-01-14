require 'order'

describe Order do

  subject(:order) { described_class.new }

  it 'should respond to the method check' do
    expect( subject ).to respond_to(:check)
  end

  it 'should return the number of items when calling method check' do
    takeaway = Menu.new
    order = takeaway.select_dishes('Spaghetti Carbonara', 'Calzone', 2)
    expect( order.check ).to eq(2)
  end

end
