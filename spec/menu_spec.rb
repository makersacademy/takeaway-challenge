require 'menu'

describe Menu do
  let(:menu)  { described_class.new }

  describe "#add" do
      it { is_expected.to respond_to(:add).with(2).arguments }
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
