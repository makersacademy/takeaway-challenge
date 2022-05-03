require 'menu'

describe Menu do
  
  subject(:menu) { Menu.new }

  it "should create an instance of class Menu" do
    expect(menu).to be_instance_of(Menu)
  end
  
  describe "#view" do
    it "should show menu options" do
      expect(menu.view).to eq(["1. Mattar Paneer £12.5", "2. Black Daal £7.5", "3. Raita £3.5", "4. Garlic Naan £3.5"])
    end
  end 

  describe "#existing_dish" do
    it "should return false if entered item is not part of menu" do
      expect(menu.existing_dish(14, 1)).to eq(false)
    end
  end

  describe "#selection" do
    it "should filter the menu for the selected dish and return it" do
      expect(menu.selection(2, 1)).to eq([{ :item => 2, :dish => "Black Daal", :price => 7.5 }])
    end
  end

end
