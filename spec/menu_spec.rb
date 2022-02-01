require_relative '../lib/menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "#show_menu" do
    it "shows what is on the menu" do
      expect(menu.show_menu).to eq "Dish: Curry, Price: £6.50\nDish: Spagbol, Price: £7.50"
    end
  end

end
