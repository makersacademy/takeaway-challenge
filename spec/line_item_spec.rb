require 'line_item'

describe LineItem do
  let(:burger) { double :dish, name: 'Burger', price: 2.5 }
  let(:line_item) { described_class.new(dish: burger, quantity: 3) }

  it 'can contain a dish' do
    expect(line_item.dish).to eq burger
  end

  it 'can contain a dish quantity' do
    expect(line_item.quantity).to eq 3
  end

  it 'can contain a subtotal' do
    expect(line_item.sub_total).to eq 7.5
  end
end
