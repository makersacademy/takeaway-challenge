require 'takeaway'
require 'dish'

describe Takeaway do

  let(:dish) { double :dish }
  let(:dish1) { Dish.new("chicken wings", 1.49) }
  let(:dish2) { Dish.new("2 piece box of fried chicken", 2.99) }
  let(:dish3) { Dish.new("Small hamburger", 2.99) }
  subject { Takeaway.new([dish1, dish2, dish3]) }

  before(:example) do
    subject.display_menu
  end

  describe '#display_menu' do
    it 'displays a menu of dishes and their prices' do
      expect(subject.dishes).to include dish1, dish2, dish3
    end
  end

  describe '#order' do
    it 'records the customer order of one dish in the basket' do
      subject.order("chicken wings")
      expect(subject.basket.to_s).to include "chicken wings"
    end
  end
end
