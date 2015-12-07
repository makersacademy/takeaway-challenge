require 'order'

describe Order do
  subject(:order) { described_class.new '2 Spring Rolls, 1 Crispy Duck', 12.97 }

  it 'stores plain text order as hash' do
    expect(order.as_hash).to eq('Spring Rolls' => 2, 'Crispy Duck' => 1)
  end

  it 'stores order total' do
    expect(order.total).to eq 12.97
  end
end
