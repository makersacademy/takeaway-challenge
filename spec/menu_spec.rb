require 'menu.rb'

describe Menu do

    it 'contains a list of dishes with prices' do
      expect(Menu::TODAYS_MENU).to be_a(Hash)
      expect(Menu::TODAYS_MENU).not_to be_empty
    end

end
