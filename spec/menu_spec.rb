require './lib/menu.rb'

describe Menu do

subject(:menu) {described_class.new}

  context "view menu" do

    it "should return the menu" do
      expect(menu.view_menu).to eq Menu::ALL_DISHES
    end

  end

end
