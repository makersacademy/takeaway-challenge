require 'dish_list'

describe DishList do
  subject(:list) { described_class.new }

  describe '#print' do
    it 'prints a list of dishes with prices' do
      expect { list.print }.to output.to_stdout
    end
  end

  describe '#data' do
    it 'returns an array' do
      expect(list.data.class).to be Array
    end
  end
end
