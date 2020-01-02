require 'controller'

describe 'Controller' do
  describe '#initialize' do
    it 'can create a new instantiated DishList' do
      subject = DishList.new(Dish)
      expect(subject).to be_an_instance_of DishList
    end
  end
