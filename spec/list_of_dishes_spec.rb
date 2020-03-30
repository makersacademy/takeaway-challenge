require 'list_of_dishes'

describe ListOfDishes do
  let(:stew_dish) { double(:stew, name: :stew) }
  let(:rice_dish) { double(:rice, name: :rice) }
  let(:dishes) { [stew_dish, rice_dish] }

  it 'see a list when there are dishes in it' do
    list = ListOfDishes.new(dishes)
    expect(list.see).to eq({ stew: stew_dish, rice: rice_dish })
  end

  it 'does not allow dishes with the same names' do
    expect { ListOfDishes.new([stew_dish, stew_dish]) }.to raise_error(ArgumentError, 'duplicate names in list of dishes')
  end

  it 'must be created with at least one dish' do
    expect { ListOfDishes.new({}) }.to raise_error(ArgumentError, 'at least one dish must be specified')
  end
end
