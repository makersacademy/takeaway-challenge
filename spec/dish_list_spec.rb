require 'dish_list'
require 'dish'

describe 'DishList' do
  describe '#initialize' do
    it 'can create a new instantiated DishList' do
      subject = DishList.new(Dish)
      expect(subject).to be_an_instance_of DishList
    end
  end
  describe '#load' do
    it 'instantiates a list of dishes from a JSON file' do
      subject = DishList.new(Dish)
      subject.load
      expect(subject.dish_list.length).to eq(5)
    end
  end
  describe '#see_menu' do
    it 'puts a list of all dishes and prices' do
      subject = DishList.new(Dish)
      subject.load
      subject.see_menu
      expect(STDOUT).to receive(:puts)
    end
  end
end
