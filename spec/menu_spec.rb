require 'menu'

describe 'menu' do

  subject(:menu) { Menu.new }

  it 'has a list of items and prices' do
    expect(menu.pizzas).to be_a(Hash)
  end

  describe "#display_menu" do
    it 'displays the menu' do
      expect(menu.display_menu.keys[0]).to be_a(String)
    end

    it 'displays the prices' do
      expect(menu.display_menu.values[0]).to be_a(Integer)
    end
  end

end
