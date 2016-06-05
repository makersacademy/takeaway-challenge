require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  it "initializes with a menu" do
    expect(subject).to have_attributes(:menu => Hash)
  end

  it "responds to view menu" do
    expect(subject).to respond_to :view_menu
  end

  it "responds to show menu" do
    expect(subject).to respond_to :show_menu
  end

  describe "#show_menu" do
    it "puts all items on the menu with prices as string" do
      expect(menu.show_menu).to eq Menu::BIG_BURGER_MENU
    end
  end

  describe "#view_menu" do
    it "list all menu items" do
      expect(menu.view_menu).to eq Menu::BIG_BURGER_MENU
    end
  end
end