require 'dish'

describe Dish do
    dish = Dish.new('burger')
    it 'should have a name' do
        expect(dish.name).to eq('burger')
    end
end