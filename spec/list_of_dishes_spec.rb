require 'list_of_dishes'

describe ListOfDishes do
  let(:dishes) { double(:dishes, instance_of?: Hash, empty?: false) }

  context 'argument errors' do
    it 'must be created with at least one dish' do
      expect { ListOfDishes.new({}) }.to raise_error(ArgumentError, 'at least one dish must be specified')
    end
  end

  describe 'viewing dishes' do
    it 'see the list of dishes' do
      list = ListOfDishes.new(dishes)
      expect(list.see).to eq(dishes)
    end
  end
end
