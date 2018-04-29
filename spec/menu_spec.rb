require './lib/menu.rb'
require 'csv'

describe Menu do
  before do
    menu_filename = './resources/menu_list.csv'
    @menu_list = CSV.read(menu_filename)
  end

  describe '#show_menu' do
    it 'should return the list of menu items' do
      expect(subject.show_menu).to eq @menu_list
    end
  end

end
