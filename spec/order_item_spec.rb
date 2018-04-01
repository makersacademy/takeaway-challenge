require 'order_item'

describe OrderItem do

  before(:each) do
    @dish = instance_double("Dish")
    allow(@dish).to receive_messages(:price => 9.99, :describe => 'Fake dish')
  end

  it 'is initialized with a price that is price of the dish x quantity' do
    expect(described_class.new(@dish, 3).price).to eq 29.97
  end

  it 'is initialized with a random 1-letter-4-digit id' do
    allow(Kernel).to receive(:rand).with(65..90).and_return(65)
    allow(Kernel).to receive(:rand).with(0..9).and_return(9)
    expect(described_class.new(@dish, 3).id).to eq 'A9999'
  end
end
