require 'menu'

describe Menu do
  subject(:menu) { described_class.new(item: nil) }
  # let(:dish) { double ('dish' name: name, price: price )}

  describe '#initialize' do
    it 'is created with 0 items' do
      expect(menu.item).to eq nil
    end

    it 'it is created with a blank list of items' do
      expect(menu.item_list).to eq []
    end
  end

  # describe '#add' do
  #   it 'adds a new item to the list of items' do
  #     item1 = { name: "Steak", price: 25 }
  #     expect(menu.add(dish1)).to eq item1
  #   end
  # end
end
