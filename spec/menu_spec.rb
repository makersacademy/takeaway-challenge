require "menu"

describe Menu do
  subject(:menu) {described_class.new}

  context "While ordering a meal" do
    it "I would lile to see a list of dished" do
      expect(menu.display_menu).not_to be_empty
    end

    it "There is a menu" do
      expect(menu.menu).not_to eq nil
    end
  end
end
