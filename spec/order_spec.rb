require 'order'

describe Order do

  let(:customer) {double :customer, name: "Joe Blogs"}
  let(:customer) {double :customer, name: "Joe Blogs"}
  let(:item) {double :item, name: "Pepperoni", quantity: 5}
  let(:item_two) {double :item_two, name: "Margherita", quantity: 5}
  let(:invalid_item) {double :item, name: "Eggs", quantity: 20}
  let(:menu_item_one) {double :menu_item_one, name: "Pepperoni", price: 5}
  let(:menu_item_two) {double :menu_item_two, name: "Margherita", price: 3}
  let(:menu_item_three) {double :menu_item_three, name: "Ham & Pineapple", price: 3}
  let(:menu) {double :menu, items: [menu_item_one, menu_item_two, menu_item_three]}
  subject(:order) {described_class.new(customer, menu)}

  describe '.items' do
    it 'has an empty list of items' do
      expect(order.items).to be_empty
    end
  end

  describe '.add' do
    it 'can add an item to items if it is on the menu' do
      order.add(item)
      expect(order.items).to include(item)
    end

    it 'cannot add an item to items if it is not on the menu' do
      expect{order.add(invalid_item)}.to raise_error("Item not found in menu!")
    end
  end

  describe '.print_item' do
    it 'prints one item from the order' do
      order.add(item)
      expect(order.print_item(item)).to eq "Pepperoni: x5\n"
    end
  end

  describe '.print_order' do
    it 'prints all items from the order' do
      order.add(item)
      order.add(item_two)
      expect(order.print_order).to eq "1. Pepperoni: x5\n2. Margherita: x5\n"
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
