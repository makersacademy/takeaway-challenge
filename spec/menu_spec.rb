require 'menu'

RSpec.describe "Menu" do

  before(:each) do
      @menu_contents = {"Fish" => 3, "Chips" => 2, "Veggie Burger" => 2, "Mushy Peas" => 0.5, "Curry Sauce" => 0.5, "Ketchup" => 0.2}
      @displayed_menu= "--Menu--\nFish: £3.0\nChips: £2.0\nVeggie Burger: £2.0\nMushy Peas: £0.5\nCurry Sauce: £0.5\nKetchup: £0.2\n"
      @formatted_menu= ["Fish: £3.0","Chips: £2.0", "Veggie Burger: £2.0", "Mushy Peas: £0.5", "Curry Sauce: £0.5", "Ketchup: £0.2"]
      @menu = Menu.new(@menu_contents)
      @header = "--Menu--"
  end

  describe 'initialize' do
    context 'when a menu has been created' do
      it 'takes a hash menu as an argument' do
        expect(@menu.menu_contents).to eq(@menu_contents)
      end
      #I want to check that keys are strings and values are integers
      it 'contains a menu title' do
        expect(@menu.header).to eq(@header)
      end
      it 'contains empty array formatted menu' do
        expect(@menu.formatted_menu).to eq([])
      end
    end
  end

  describe '#view' do
    context 'when a menu has been created and formatted' do
      it 'displays a menu' do
        @menu.format_menu_contents
        expect{@menu.view}.to output(@displayed_menu).to_stdout
      end
    end
  end

  describe '#format_menu_contents' do
    context 'when a menu has been created and formatted' do
      it 'creates an array of strings' do
        @menu.format_menu_contents
        expect(@menu.formatted_menu).to eq(@formatted_menu)
      end
    end
  end

end
