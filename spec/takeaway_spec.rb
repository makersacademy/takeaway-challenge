require 'takeaway'

RSpec.describe Takeaway do
  before do
    name = "Cod"
    price = "6"

    @takeaway = Takeaway.new name, price
  end

  it 'should respond to name' do
    expect(@takeaway).to respond_to(:name)
  end

  it 'should respond to price' do
    expect(@takeaway).to respond_to(:price)
  end

  it 'should respond to order' do
    expect(@takeaway).to respond_to(:order)
  end

  it 'should return a food for a name' do
    expect(@takeaway.name).to eq ("Cod")
  end

  it 'should return £6 for a price' do
    expect(@takeaway.price).to eq ("6")
  end

  it 'shout return true for order' do
    expect(@takeaway.order).to eq(true)
  end

end