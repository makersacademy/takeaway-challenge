require 'dish'

describe Dish do
    
    subject(:dish) { described_class.new(:name, :price) }
    
    it 'has a name on initalization' do
        expect(dish.name).to eq :name
    end
    
    it 'has a price on initalization' do
        expect(dish.price).to eq :price
    end

end