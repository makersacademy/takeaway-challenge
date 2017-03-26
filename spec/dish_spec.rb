require './lib/dish.rb'

describe Dish do

  let(:curry) {described_class.new("Vindaloo", 8)}

    it 'stores the name of the dish' do
      expect(curry.name).to eq ("Vindaloo")
    end

    it 'stores the price of the dish' do
      expect(curry.price).to eq 8
    end


end
