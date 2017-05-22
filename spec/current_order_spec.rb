require 'current_order'

describe CurrentOrder do

  let(:currentorder) { double(:currentorder, ordered_dishes: [{ dish: :Pizza, price: 8.50 }, { dish: :Pasta, price: 9.20 }]) }

  before :each do
    @current_order = CurrentOrder.new
  end

  it 'returns a CurrentOrder object' do
    expect(@current_order).to be_an_instance_of CurrentOrder
  end

  it 'initializes with an empty array' do
    expect(@current_order.ordered_dishes).to respond_to(:count)
  end

  it 'calculates the total price of the order' do
    expect(@current_order.ordertotal(currentorder.ordered_dishes)).to eq(17.70)
  end

end
