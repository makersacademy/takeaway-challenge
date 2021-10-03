require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:shop) { described_class.new(menu) }
  let(:name_one) { "name one" }
  let(:price_one) { "£0.01" }
  let(:name_two) { "name two" }
  let(:price_two) { "£0.02" }
  let(:item_one) { double :item, :name => name_one, :price => price_one }
  let(:item_two) { double :item, :name => name_two, :price => price_two }

  
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
      item_one_name = name_one
      item_one_cost = price_one
      shop.add_item(item_one_name, item_one_cost)
    end
  end

  describe '#pick' do
    it 'returns item object when picked' do
      expect(menu).to receive(:list).and_return [item_one]

      shop.pick(name_one)
    end
  end

  describe '#display_basket' do
    it 'returns an array of items when multiple picked' do
      expect(menu).to receive(:list).twice.and_return [item_one, item_two]
      shop.pick(name_one)
      shop.pick(name_two)

      expect(shop.display_basket).to include item_one, item_two
    end
  end
  
  describe '#sub_total' do
    before do
      expect(menu).to receive(:list).twice.and_return [item_one, item_two]
      shop.pick(name_one)
      shop.pick(name_two)
    end

    it "adds together costs" do
      cost = price_one.gsub("£","").to_f + price_two.gsub("£","").to_f 
      expect(shop.sub_total).to eq "£#{cost}"
    end

    it "resets after checking" do
      first_sub_total = shop.sub_total
      expect(shop.sub_total).to eq first_sub_total
    end
  end
end
