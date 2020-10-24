require 'dish'

RSpec.describe Dish do
  describe '#initialize' do
    subject { Dish.new("Tikka Masala", 8.99) }
    it 'returns the name of the dish' do
      expect(subject.name).to eq "Tikka Masala"
    end
    it 'returns the price of the dish' do
      expect(subject.price).to eq 8.99
    end
  end
end
