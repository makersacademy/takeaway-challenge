require 'takeaway'
require 'food_menu'

describe Takeaway do

  subject(:chinese_takeaway) { Takeaway.new(chinese_food) }
  let(:chinese_food) { double :FoodMenu, print: chicken }

  subject(:indian_takeaway) { Takeaway.new(indian_food) }
  let(:indian_food) { double :FoodMenu, print: multiple_dishes }

  let(:chicken) { 'Sweet and Sour Chicken: 4.00' }
  let(:multiple_dishes) { {naan: 0.90, penang_curry: 5.00} }

  context '#see_dishes' do

    it '`see_dishes` method outputs a dish' do
      expect(chinese_takeaway.see_dishes).to eq(chicken)
    end

    it '`see_dishes` method outputs multiple dishes' do
      expect(indian_takeaway.see_dishes).to eq(multiple_dishes)
    end

  end

end