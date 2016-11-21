require 'dish'

describe Dish do

  context '#initialize' do
    context 'with parameters' do
      let(:dish) { Dish.new("Rice", "£1.99") }

        it 'shoul use specified values' do
          expect(dish.food).to eq "Rice"
          expect(dish.price).to eq "£1.99"
        end
    end
  end
end
