require 'menu'

RSpec.describe "Menu" do
  before(:each) do
      @menu_contents = {"Fish" => 3, "Chips" => 2, "Veggie Burger" => 2, "Mushy Peas" => 0.5, "Curry Sauce" => 0.5, "Ketchup" => 0.2}
  end


  describe '#initialize' do

    it 'stores the menu it is passed on initialization' do
      menu = Menu.new(@menu_contents)
      expect(menu.menu_contents).to eq(@menu_contents)
    end

  end

  describe '#view' do

    it 'displays a menu' do
      menu = Menu.new(@menu_contents)
      expect(menu).to respond_to(:view)
    end

  end


end
