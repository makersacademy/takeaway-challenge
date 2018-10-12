require 'customer'
require 'menu'
require 'dish'
require 'order'

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
      expect(subject.verify_order).to eq "Cabage x2 $10"
    end
  end
end
