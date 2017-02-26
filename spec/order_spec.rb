require 'order'

describe Order do

  let(:customer) {double :customer, name: "Joe Blogs"}
  subject(:order) {described_class.new(customer)}
  let(:item) {double :item}

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



end
