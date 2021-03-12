require 'menu'

describe Menu do
  describe 'menu_list' do
    it "is an array" do
      expect(subject.menu_list).to be_a(Array)
    end
  end

  describe "load_menu_items" do
    it "loads the contents of the CSV file to the array menu_list as hashes" do
      expect(subject.load_menu_items).to include(include(:name, :price,))
    end
  end

  describe "search_menu_items" do
    it "finds the item within the menu when passed a number" do
      expect(subject.search_menu_items(1)).to eq({ :number => 1, :name => "Veggie chow mein", :price => 4, :preparation_time => 15 })
    end
    it "finds the time within the menu when passed a item name" do
      expect(subject.search_menu_items("Veggie chow mein")).to eq({ :number => 1, :name => "Veggie chow mein", :price => 4, :preparation_time => 15 })
    end
  end
end
