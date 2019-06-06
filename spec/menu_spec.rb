require 'menu'

RSpec.describe "Menu" do
@menu = {"Fish" => 3, "Chips" => 2, "Veggie Burger" => 2, "Mushy Peas" => 0.5, "Curry Sauce" => 0.5, "Ketchup" => 0.2}

  describe '#initialize' do

    it 'stores the menu it is passed on initialization' do
      menu = Menu.new(@menu)
      expect(menu.menu_contents).to eq(@menu)
    end

  describe '#view' do

    it 'displays a menu' do
      menu = Menu.new(@menu)
      expect(menu.view).to include(@menu)
    end

  end


end
