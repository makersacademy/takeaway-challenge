require 'dish'

describe Dish do
  let(:dish) { described_class.new('pizza', 5) }

  context '#initialize' do
    it 'knows its name' do
      expect(dish.name).to eq 'pizza'
    end

    it 'knows its price' do
      expect(dish.price).to eq 5
    end
  end
end
