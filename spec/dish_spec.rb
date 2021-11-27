require 'dish'

describe Dish do
  let(:dish) { described_class.new("spaghetti", 10) }

  context '#read_name' do
    it 'can read name of the dish' do
      expect(dish.read_name).to eq("spaghetti")      
    end
  end

  context '#read_price' do
    it 'can read price of the dish' do
      expect(dish.read_price).to eq(10)      
    end
  end

  context '#read_quantity' do
    it 'can read quanatity of the dish' do
      quantity = rand(1..5)
      dish.amount(quantity)
      expect(dish.read_quantity).to eq(quantity)      
    end
  end

  context '#amount' do
    it 'can set the quantity of the dish ordered' do
      quantity = rand(1..5)
      dish.amount(quantity)
      expect(dish.read_quantity).to eq(quantity)
    end
  end

  context '#dish_total' do
    it 'can calculate total price for a given dish item' do
      quantity = rand(1..5) 
      dish.amount(quantity)     
      expect(dish.dish_total).to eq(10 * quantity)
    end
  end

end
  