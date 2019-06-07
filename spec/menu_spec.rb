require 'menu'

RSpec.describe "Menu" do

  before(:each) do
      @menu_contents = {"Fish" => 3, "Chips" => 2, "Veggie Burger" => 2, "Mushy Peas" => 0.5, "Curry Sauce" => 0.5, "Ketchup" => 0.2}
      @displayed_menu= "Menu\nFish: £3.0\nChips: £2.0\nVeggie Burger: £2.0\nMushy Peas: £0.5\nCurry Sauce: £0.5\nKetchup: £0.2\n"
  end


  describe '#view' do

    it 'displays a menu' do
      menu = Menu.new
      expect{menu.view}.to output(@displayed_menu).to_stdout
    end

  end


end
