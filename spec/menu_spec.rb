require 'menu'

describe Menu do

  let(:menu_list) {Menu::MENU_LIST}

    it "has 14 items on the menu" do
      expect(menu_list.size).to eq(14)
    end
end
