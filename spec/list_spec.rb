require 'list'

describe List do
  subject(:list){described_class.new}
  let(:dish) {double :dish}
  let(:price) {double :price}

  it 'should initialize with an empty list' do
    expect(list.dish_list).to eq({})
  end

  describe '#add_dish' do
    it 'should update dishes list with new dishes' do
        list.add_dish(dish, price)
        expect(list.dish_list).to eq({dish => price})
    end
  end

end
