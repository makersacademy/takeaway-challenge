require 'takeaway'
require 'menu'

describe Takeaway do
  let(:takeaway)  { described_class.new }
  let(:menu)  { described_class.new }

    before(:each) do
      subject.add_dish("Dish1", 5)
      subject.add_dish("Dish2", 2)
      subject.add_dish("Dish3", 4)
    end

  describe '#show_menu' do
    it { is_expected.to respond_to(:show_menu) }
    it 'should return items in the menu' do
      expect(subject.show_menu).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#add_dish' do
    it { is_expected.to respond_to(:add_dish).with(2).arguments }
    it 'should add a dish to the menu array' do
      expect(subject.show_menu).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}])
    end
  end
end
