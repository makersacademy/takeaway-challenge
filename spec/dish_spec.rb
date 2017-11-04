require 'dish'

describe Dish do
  subject(:dish) { described_class.new('korma', {chicken: 5.95}) }

  describe 'initialize' do
    it 'holds a readable name variable' do
      expect(dish.name).to eq('korma')
    end

    it 'holds a hash of available options and their prices' do
      expect(dish.options).to be_a(Hash).and include({chicken: 5.95})
    end
  end
end
