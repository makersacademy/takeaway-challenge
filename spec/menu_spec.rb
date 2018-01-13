require './lib/menu.rb'

describe Menu do

  context '#initialize' do
    it 'should initialize with an hash as menu' do
      menu = Menu.new
      expect(menu.the_menu).to be_an_instance_of(Hash)
    end
  end

  context '#add_to_menu' do
    it 'should add in the required food into the menu when called' do
      menu = Menu.new
      menu.add_to_menu('gravy', 5)
      expect(menu.the_menu).to include("gravy" => 5)
    end
  end


end
