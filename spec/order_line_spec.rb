require 'order_line'

describe OrderLine do

  before do
    @quantity = 2
    @price = 5.95
    @name = "Margherita"
  end

  let(:dish) { double("Dish", name: @name, price: @price) }

  subject(:line) { described_class.new(dish, @quantity) }

  it 'should initialize with dish' do
    expect(line.dish).to eq dish
  end

  it 'should initialize with a quantity' do
    expect(line.quantity).to eq @quantity
  end

  it 'should calculate cost' do
    expect(line.cost).to eq (@quantity * @price)
  end
end
