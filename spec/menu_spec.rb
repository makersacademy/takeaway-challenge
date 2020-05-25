require 'menu'

describe Menu do
  subject(:menu) { Menu.new }
  let(:dish) { "Large Fish Supper" }

  it 'has a list of dishes' do
    expect(menu.dishes).to be_an_instance_of(Hash)
  end

  describe 'not_on_menu?(dish)' do
    it 'returns false if the dish is on the menu' do
      expect(menu.not_on_menu?(dish)).to eq false
    end
  end

  describe '#get_price_for(dish)' do
    it 'returns the price of the dish' do
      expect(menu.get_price_for(dish)).to eq 7.90
    end
  end

  describe '#get_name' do
    it 'returns the actual name of the dish' do
      expect(menu.get_name(dish.downcase)).to eq("Large Fish Supper")
    end
  end
end
