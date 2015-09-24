require 'dish'

describe Dish do

  describe "#initialize/new" do
    it "can make a new dish of name 'egg fried rice' with price of 4.50" do
      new_dish = Dish.new('egg fried rice', 4.50)
      expect(new_dish.name).to eq('egg fried rice')
      expect(new_dish.price).to eq(4.50)
    end
  end

  describe '#display_info' do
    it 'displays correct dish information' do
      dish = Dish.new('Egg Fried Rice',3.95)
      expect(dish.display_info).to eq(
      'Egg Fried Rice                         £   4.95')
    end
  end

end
