require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:food) { 'Satay' }
  let(:random_food) { Item.new('Turkish Delight', 4.00) }

  it 'allows customers to view the menu items' do
    expect{ menu.items }.not_to raise_error
  end

  describe '#get_item' do
    it 'can look up an item' do
      expect(menu.get_item(food).name).to eq food
    end

    it 'raises an error if the item is not on the menu' do
      expect{ menu.get_item(random_food.name) }.to raise_error 'Sorry we don\'t have that on our menu'
    end
  end

  describe '#add and #remove' do
    it 'can have more items added to the menu' do
      menu.add(random_food)
      expect(menu.items).to include random_food
    end

    it 'can have items removed from the menu' do
      menu.add(random_food)
      menu.remove(random_food.name)
      expect(menu.items).not_to include random_food
    end
  end
end
