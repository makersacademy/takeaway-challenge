require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:shop) { described_class.new(menu) }
  let(:item_one) { double :item, :name => "name one", :price => "£0.01" }
  
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

end
