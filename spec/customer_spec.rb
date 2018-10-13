require 'customer'
require 'menu'
require 'dish'
require 'order'
require 'pry'

describe Customer do

  describe '#initialize' do
    it 'should have an initialized order' do
      expect(subject.order).to be_a Order
    end
  end

  describe '#Check_list' do
    it ' Should recieve a list' do
      list = Menu.new
      dish = Dish.new("Cabage", 5)
      list.add_dish(dish)
      expect(subject.check_menu(list)).to eq list.list_dishes
    end
  end

  describe '#select_dish' do
    it 'should add dish to order' do
      list = Menu.new
      dish = Dish.new("Cabage", 5)
      list.add_dish(dish)
      expect(subject.select_dish(list, "Cabage", 2)).to eq "2 Cabage added"
    end
  end

  describe '#verify_order' do
    it 'should return a printed list of the order with added numbers' do
      list = Menu.new
      dish = Dish.new("Cabage", 5)
      list.add_dish(dish)
      subject.select_dish(list, "Cabage", 2)
      expect(subject.verify_order).to eq ["Cabage x2 $10"]
    end

    it 'should return a printed list with multi orders with added numbers' do
      list = Menu.new
      dish = Dish.new("Cabage", 5)
      dish1 = Dish.new("Steak", 40)
      dish2 = Dish.new("Mac & Cheese", 2)
      list.add_dish(dish)
      list.add_dish(dish1)
      list.add_dish(dish2)
      subject.select_dish(list, "Cabage", 2)
      subject.select_dish(list, "Steak", 1)
      subject.select_dish(list, "Mac & Cheese", 3)
      expect(subject.verify_order).to eq ["Cabage x2 $10", "Steak x1 $40", "Mac & Cheese x3 $6"]
    end
  end

  describe '#total_balance' do
    it 'Should return the proper amount' do
      list = Menu.new
      dish = Dish.new("Cabage", 5)
      dish1 = Dish.new("Steak", 40)
      dish2 = Dish.new("Mac & Cheese", 2)
      list.add_dish(dish)
      list.add_dish(dish1)
      list.add_dish(dish2)
      subject.select_dish(list, "Cabage", 2)
      subject.select_dish(list, "Steak", 1)
      subject.select_dish(list, "Mac & Cheese", 3)
      expect(subject.total_balance).to eq 56
    end
  end

  describe '#place_order' do
    it 'should eq something' do
      expect(subject.place_order).to_not eq nil
    end
  end
end
