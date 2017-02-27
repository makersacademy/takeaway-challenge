require 'takeaway'
require 'message'

describe Takeaway do
  before (:each) do
    @dbl = double(:menu, :dishes => [{
                                      "Burger Meal" => 7,
                                      "Lobster Meal" => 10
                                    }])
  end
    subject(:takeaway) { described_class.new(@dbl) }

  describe '#print_menu' do
    it 'displays menu' do
      expect(takeaway.print_menu).to eq "Burger Meal: £7,Lobster Meal: £10"
    end
  end

  describe '#add_to_basket' do
    it 'adds to basket' do
      expect { takeaway.add_to_basket("Burger Meal", 2) }.to change { takeaway.basket }.to ([["Burger Meal", 2, 14]])
    end
  end

  describe '#confirm_meal' do
    it 'confirms the meal to customer' do
      takeaway.add_to_basket("Burger Meal", 2)
      expect(takeaway.confirm_meal).to eq ("Confirmed order: 2x Burger Meal, Total cost: £14")
    end
  end

  describe '#clear_basket' do
    it 'clears the basket' do
      takeaway.add_to_basket("Burger Meal", 2)
      expect { takeaway.clear_basket }.to change{ takeaway.basket }.to ([])
    end
  end
end
