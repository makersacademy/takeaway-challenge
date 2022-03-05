require 'order'

describe Order do
  subject(:my_order) { described_class.new }

  it 'can create an Order' do
    expect(my_order).to be_a_kind_of(Order)
  end

  it 'has a default empty array to store the order' do
    expect(my_order.order).to eq []
  end

  it 'adds pasta dish to order array' do
    expect(my_order.add_dish('pasta')).to eq ['pasta']
  end

  it 'stores a pasta dish' do
    my_order.add_dish('pasta')
    expect(my_order.order).to include('pasta')
  end
end
