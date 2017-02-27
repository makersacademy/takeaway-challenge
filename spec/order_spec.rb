require 'order'

describe Order do
subject(:order) { described_class.new(menu)}
let(:menu) { double(:menu) }
let(:items) do
  {
    Yum: 1,
    Tasty: 2
  }
end
  it 'adds items from the menu' do
    order.add_item(:Yum, 1)
    order.add_item(:Tasty, 2)
    expect(order.items).to eq(items)
  end

end
