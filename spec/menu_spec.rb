require 'menu'

describe Menu do
  subject(:menu){described_class.new}

  it 'is created with a list of dishes' do
    expect(menu.view_menu).not_to be_empty
  end

  describe '#dish_on_menu?' do
    it "confirms a dish is on the menu" do
      expect(menu.dish_on_menu?("cod")).to be_truthy
    end
    it "confirms a dish is NOT on the menu" do
      expect(menu.dish_on_menu?("goat")).to be_falsey
    end
  end

end
