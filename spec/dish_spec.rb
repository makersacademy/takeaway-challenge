require 'dish'

describe Dish do
  subject(:test_dish) {described_class.new 'dish_1' , 1}

  describe '#initalize' do

    it 'can be initalized with a name' do
        expect(test_dish.dish_name).to eq 'dish_1'
    end

    it 'can be initalized with a price' do
        expect(test_dish.dish_price).to eq 1
    end

  end

end
