require 'dish'

describe Dish do
  let(:name) { "Pizza" }
  let(:price) { 5 }
  
  context 'new' do
    before do
      @dish = Dish.new(name, price)
    end
    it 'stores the name' do      
      expect(@dish.name).to eq name
    end
    it 'stores the price' do
      expect(@dish.price).to eq price
    end
  end
end
