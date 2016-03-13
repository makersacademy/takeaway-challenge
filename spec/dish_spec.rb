require 'dish'

describe Dish do
  subject(:dish){ described_class.new(name: 'Chicken Wings', price: 4)}

  describe '#initialize' do
    it '> should be initialized with a name' do
      expect(dish.name).to eq('Chicken Wings')
    end

    it '> should be initialized with a price' do
      expect(dish.price).to eq(4)
    end
  end

end
