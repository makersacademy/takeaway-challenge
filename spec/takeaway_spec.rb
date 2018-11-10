require 'takeaway'
require 'dish'

describe Takeaway do

  let(:dish) { double :dish }
  let(:dish1) { Dish.new("Chicken Wings", 1.49) }
  let(:dish2) { Dish.new("2 piece box of Fried Chicken", 2.99) }
  let(:dish3) { Dish.new("Small Hamburger", 2.99) }
  subject { Takeaway.new([dish1, dish2, dish3]) }

  def two_chick_wings
    2.times do
      subject.order("chicken wings")
    end
  end

  before(:example) do
    subject.display_menu
  end

  describe '#display_menu' do
    it 'displays a menu of dishes and their prices' do
      expect(subject.menu).to include dish1, dish2, dish3
    end
  end

  describe '#order' do
    it 'records the customer order of one dish in the basket' do
      subject.order("chicken wings")
      expect(subject.basket_subtotal[dish1]).to eq 1
    end

    it 'records the customer order of multiple orders of one item' do
      two_chick_wings
      expect(subject.basket_subtotal[dish1]).to eq 2
    end
  end

  describe '#show_basket' do
    it 'displays a subtotal of each type of dish ordered' do
      two_chick_wings
      expect { subject.show_basket }.to \
      output("Your basket contains:\n2 x Chicken Wings = £2.98\n").to_stdout
    end
  end
end
