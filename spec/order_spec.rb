require 'order'
describe Order do
  subject(:order) { described_class.new }
  it 'Creates an empty order hash' do
    expect(order.items).to eq({})
  end
  describe '#order_item' do
    it 'Adds an item and quantity of that item to the items hash' do
      subject.order_item("Pizza", 2)
      expect(order.items).to include({ "Pizza" => 2 })
    end
  end
end
