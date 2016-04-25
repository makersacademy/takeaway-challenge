require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish1) { double(:dish, name: 'dish1', price: 1) }
  let(:dish2) { double(:dish1, name: 'dish2', price: 2) }

  before(:each) do
    menu.add_new_dish(dish1)
    menu.add_new_dish(dish2)
  end

  describe '#print_menu' do

    it 'prints each of the dishes' do
    expect{ menu.print_menu }.to output("dish1: $1\ndish2: $2\n").to_stdout
    end

  end

  describe '#dish_price' do

    it 'accept dish name in string and returns the price' do
      menu.add_new_dish(dish1)
      expect(menu.dish_price('dish1')).to eq 1
    end

  end

  describe '#dish_in_menu?' do

    it 'returns true if dish is in the menu' do
      expect(menu.dish_in_menu?('dish1')).to eq true
    end

    it 'returns false if dish is not in the menu' do
      expect(menu.dish_in_menu?('dish3')).to eq false
    end

  end

end