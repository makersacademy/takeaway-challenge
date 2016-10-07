require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:item){double(:price)}
  let(:price){double(:price)}


  describe "#select_item" do
    it 'allows for each food item to be selected' do
      order.select_item(item)
      expect(order.put_in_basket).to include item
    end

    it 'displays price in the basket' do
      order.select_item(price)
      expect(order.put_in_basket).to include price
    end
  end

end
