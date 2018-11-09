require 'takeaway'
require 'dish'

describe Takeaway do

  let(:dish) { double :dish }
  let(:dish1) { Dish.new("Chicken Wings", 1.49) }
  let(:dish2) { Dish.new("2 piece box of fried chicken", 2.99) }
  subject { Takeaway.new([dish1, dish2]) }

  describe '#display_menu' do
    it 'displays a menu of dishes and their prices' do
      subject.display_menu
      expect(subject.dishes).to include(dish1)
      expect(subject.dishes).to include(dish2)
    end
  end
end
