require 'takeaway'
require 'menu'

describe Takeaway do
  let(:takeaway)  { Takeaway.new }
  let(:menu)  { Menu.new }

  before(:each) do
    subject.add_dish("Dish1", 5)
    subject.add_dish("Dish2", 2)
    subject.add_dish("Dish3", 4)
  end

  describe '#show_menu' do
    it 'should respond to show_menu'do
      expect(subject).to respond_to(:show_menu)
    end
    it 'should return items in the menu' do
      expect(subject.show_menu).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#add_dish' do
    it 'should respond to add_dish with 2 arguments' do
      expect(subject).to respond_to(:add_dish).with(2).arguments
    end
    it 'should add a dish to the menu array' do
      expect(subject.show_menu).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#add_to_order' do
    it 'should respond to order'do
      expect(subject).to respond_to(:add_to_order).with(1).arguments
    end
    it 'should add a number of dishes ordered to order_array' do
      expect(subject.add_to_order("1,3")).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#basket' do
    it 'should respond to basket' do
      expect(subject).to respond_to(:basket)
    end
    it 'should show the items in the basket from the ordered array' do
      subject.add_to_order("1, 3")
      expect(subject.basket).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#total_basket' do
    it 'should respond to checkout' do
      expect(subject).to respond_to(:total_basket)
    end
    it 'should add up the total price of dishes ordered' do
      takeaway.add_dish("Dish1", 5)
      takeaway.add_dish("Dish2", 2)
      takeaway.add_dish("Dish3", 4)
      takeaway.add_to_order("1,3")
      expect(takeaway.total_basket).to eq ("Your total - £9")
    end
  end
end
