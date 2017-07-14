require 'dish_list'

describe DishList do
  subject(:list) { described_class.new }

  describe '#show' do
    it 'shows a list of dishes with prices' do
      expect(list.show).not_to be nil
    end
  end
end
