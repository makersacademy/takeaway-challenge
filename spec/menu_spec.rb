require 'menu'

describe Menu do

  menu = Menu.new

  it 'default csv file is current_menu.csv' do
    expect(menu.instance_variable_get(:@menu_file)).to eq "./lib/menus/current_menu.csv"
  end

  describe '#load_menu' do
    context 'populates @current_menu with csv file data' do
      test = "./spec/test-menus/test.csv"
      new_menu = Menu.new(test)
      expect(new_menu.current_menu).to eq [{ :food => "food1", :price => 1 }, { :food => "food2", :price => 2 }]
    end
  end

end
