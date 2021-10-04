require './docs/dish'

describe Dish do
  let(:dish_name_1) { 'burger' }
  let(:dish_price_1) { 10 }
  let(:dish_entry_1) { { :dish_name => dish_name_1, :dish_price => dish_price_1 } }

  describe '#initialize' do
    it 'creates a dish entry as a hash' do
      dish = Dish.new(dish_name_1, dish_price_1)
      expect(dish.dish_entry).to eq(dish_entry_1)
    end
  end
end
