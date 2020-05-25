require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  it 'has a list of dishes' do
    expect(menu.dishes).to be_an_instance_of(Hash)
  end

  describe 'on_menu?(dish)' do
    it 'returns price if the dish is on the menu' do
      expect(menu.not_on_menu?("Large Fish Supper")).to eq false
    end
  end

  describe '#get_price_for(dish)' do
    it 'returns the price of the dish' do
      expect(menu.get_price_for("Large Fish Supper")).to eq 7.90
    end
  end

  describe '#get_name' do
    it 'returns the actual name of the dish' do
      expect(menu.get_name("large fish supper")).to eq("Large Fish Supper")
    end
  end
end
