require 'order'
describe Order do
  subject(:order) { described_class.new }
  let(:menu_item){ double('item') }
  describe '#initialize' do

    it "has an empty array of items on initialization" do
      expect(order.order_items).to be_empty
    end

  end

  describe '#save_item' do

    it "saves an item to the order list" do
      expect(order.save_item(menu_item)).to contain_exactly menu_item
    end

  end
end
