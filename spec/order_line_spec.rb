require 'order_line'

describe OrderLine do

  let(:dish) { double("Dish") }
  @quantity = 2
  subject(:line) { described_class.new(:dish, @quantity) }

  it 'should initialize with dish' do
    expect(line.dish).to eq :dish
  end

  it 'should initialize with a quantity' do
    expect(line.quantity).to eq @quantity
  end

end
