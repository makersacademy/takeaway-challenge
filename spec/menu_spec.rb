require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:food) { 'Satay' }
  let(:random_food) { Dish.new('Turkish Delight', 4.00) }

  it 'allows customers to view the menu dishes' do
    expect{ menu.dishes }.not_to raise_error
  end

  describe '#get_dish' do
    it 'can look up an dish' do
      expect(menu.get_dish(food).name).to eq food
    end

    it 'raises an error if the dish is not on the menu' do
      expect{ menu.get_dish(random_food.name) }.to raise_error 'Sorry we don\'t have that on our menu'
    end
  end

  describe '#add and #remove' do
    it 'can have more dishes added to the menu' do
      menu.add(random_food)
      expect(menu.dishes).to include random_food
    end

    it 'can have dishes removed from the menu' do
      menu.add(random_food)
      menu.remove(random_food.name)
      expect(menu.dishes).not_to include random_food
    end
  end
end
