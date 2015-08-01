require 'dish'

describe Dish do

  describe '#create' do
    it 'responds to #create' do
      expect(Dish).to respond_to(:create).with(2).arguments
    end

    it 'new item with name' do
      spaghetti = Dish.create('Spaghetti', 3.50)
      expect(spaghetti.name).to eq "Spaghetti"
    end

    it 'new item with price' do
      spaghetti = Dish.create('Spaghetti', 3.50)
      expect(spaghetti.price).to eq 3.50
    end

  end
end