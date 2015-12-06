require 'dish_list'

describe DishList do
  let(:dish1) {double(:dish1, price: 1, name: :pizza)}
  let(:dish2) {double(:dish2, price: 2, name: :chicken)}
  subject(:dish_list){described_class.new([dish1, dish2])}

  describe '#price_list' do
    it 'gives a list with the price of each dish' do
      expect(dish_list.price_list).to eq ({pizza: 1, chicken: 2})
    end
  end
end
