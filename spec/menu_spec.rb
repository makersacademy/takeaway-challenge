# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices


require 'menu'
require 'dish'

describe 'Menu' do
  describe '#initialize' do
    it 'can create a new instantiated Menu' do
      subject = Menu.new(Dish)
      expect(subject).to be_an_instance_of Menu
    end
  end
  describe '#load' do
    it 'instantiates a menu from a JSON file' do
      subject = Menu.new(Dish)
      subject.load
      expect(subject.menu.length).to eq(5)
    end
  end
  describe '#see_menu' do
    it 'puts a list of all dishes and prices' do
      subject = Menu.new(Dish)
      subject.load
      subject.see_menu
      expect(subject).to respond_to(:see_menu)
    end
  end
end
