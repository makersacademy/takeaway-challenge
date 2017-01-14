require 'menu'

describe Menu do
  let(:menu)  { Menu.new }

  describe "#add_dish" do
    it 'responds to add_dish' do
      expect(subject).to respond_to(:add).with(2).arguments
    end
    it 'should add a dish to the menu array' do
      subject.add("Dish1", 5)
      expect(subject.menu_array).to include(:name => "Dish1", :price => 5)
    end
  end
  describe '#show_menu_array' do
    it 'should return items in the array' do
      subject.add("Dish1", 5)
      expect(subject.show_menu_array).to eq([{:name => "Dish1", :price => 5}])
    end
  end

end
