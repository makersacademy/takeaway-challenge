require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:shop) { described_class.new(menu) }
  let(:item_one) { double :item, :name => "name one", :price => "£0.01" }
  let(:item_two) { double :item, :name => "name two", :price => "£0.02" }
  
  describe '#menu' do
    it "can be accessed" do
      expect(shop).to respond_to(:menu)
    end

    it "displays to the customer" do
      expect(menu).to receive(:list)

      shop.menu
    end
  end

  describe '#add_item' do
    it 'adds item to the menu' do
      expect(menu).to receive(:add)
      item_one_name = "name one"
      item_one_cost = "£0.01"
      shop.add_item(item_one_name, item_one_cost)
    end
  end

  describe '#pick' do
    it 'returns item object when picked' do
      expect(menu).to receive(:list).and_return [item_one]
      shop.pick("name one")
    end

    it 'returns an array of items when multiple picked' do
      expect(menu).to receive(:list).twice.and_return [item_one, item_two]
      shop.pick("name one")
      shop.pick("name two")
      expect(shop.display_picks).to include item_one, item_two
    end
  end

end
