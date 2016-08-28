require 'dish'

describe Dish do

  describe '#initialize' do
    before(:context) do
      @dish = Dish.new(name: "Chicken", price: 1)
    end
    context 'when created' do
      it 'has a name' do
        expect(@dish.name).to eq "Chicken"
      end
      it 'has a price' do
        expect(@dish.price).to eq 1
      end
    end
  end

end
