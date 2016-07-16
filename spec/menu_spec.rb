require 'menu.rb'

describe Menu do

    it 'contains a list of dishes with prices' do
      expect(Menu::TODAYS_MENU).to be_a(Hash)
    end

end
