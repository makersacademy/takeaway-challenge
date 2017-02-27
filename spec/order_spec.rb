require 'order'

describe Order do

  let(:customer) {double :customer, name: "Joe Blogs"}
  subject(:order) {described_class.new(customer)}
  let(:item) {double :item, name: "Pizza", quantity: 5}
  let(:item_two) {double :item_two, name: "More Pizza", quantity: 5}

  describe '.items' do
    it 'has an empty list of items' do
      expect(order.items).to be_empty
    end
  end

  describe '.add' do
    it 'can add an item to items' do
      order.add(item)
      expect(order.items).to include(item)
    end
  end

  describe '.print_item' do
    it 'prints one item from the order' do
      order.add(item)
      expect(order.print_item(item)).to eq "Pizza: x5\n"
    end
  end

  describe '.print_order' do
    it 'prints all items from the order' do
      order.add(item)
      order.add(item_two)
      expect(order.print_order).to eq "1. Pizza: x5\n2. More Pizza: x5\n"
    end
  end

  describe '.total' do
    let(:calc) {double :calc}

    it 'calculates the order total' do
      allow(calc).to receive(:total).and_return(1)
      order.add(item)
      order.add(item_two)
      expect(order.total(calc)).to eq 1
    end
  end

end
