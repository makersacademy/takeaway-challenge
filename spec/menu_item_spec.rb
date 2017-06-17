require 'menu_item'

describe MenuItem do

  let(:title) { 'Horse Burger' }
  let(:price) { 7.99 }
  let(:item)  { described_class.new(title: title, price: price) }

  describe 'Attributes' do
    it 'has a title' do
      expect(item.title).to eq title
    end

    it 'has a price' do
      expect(item.price).to eq price
    end
  end
end
