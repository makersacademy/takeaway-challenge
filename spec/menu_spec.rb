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
end
