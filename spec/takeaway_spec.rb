require 'takeaway'
require 'menu'

describe Takeaway do
  let(:takeaway)  { Takeaway.new }
  let(:menu)  { Menu.new }

  describe '#show_menu' do
    it 'should respond to show_menu'do
      expect(subject).to respond_to(:show_menu)
    end
    it 'should return items in the menu' do
      subject.add_dish("Dish1", 5)
      expect(subject.show_menu).to eq([{:name => "Dish1", :price => 5}])
    end
  end
  describe '#add_dish' do
    it 'should respond to add_dish with 2 arguments' do
      expect(subject).to respond_to(:add_dish).with(2).arguments
    end
    it 'should add a dish to the menu array' do
      subject.add_dish("Dish1", 5)
      expect(subject.show_menu).to include(:name => "Dish1", :price => 5)
    end
  end
  describe '#order' do
    it 'should respond to order'do
      expect(subject).to respond_to(:order).with(1).arguments
    end
    it 'should add a number of dishes ordered to order_array' do
      subject.add_dish("Dish1", 5)
      subject.add_dish("Dish2", 2)
      subject.add_dish("Dish3", 4)
      expect(subject.order("1,3")).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
    end
  end
end
