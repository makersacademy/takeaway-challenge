require 'dish_list'

describe DishList do
  subject(:list) { described_class.new }

  describe '#data' do
    it 'expected to return array' do
      expect(list.data.class).to be Hash
    end
  end
end
