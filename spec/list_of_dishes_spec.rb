require 'list_of_dishes'

describe ListOfDishes do
  let(:dishes) { double(:dishes, instance_of?: Hash, empty?: false, each: true) }

  it 'see a list when there are dishes in it' do
    list = ListOfDishes.new(dishes)
    expect(list.see).to eq(dishes)
  end

  it 'must be created with a hash' do
    expect { ListOfDishes.new([]) }.to raise_error(ArgumentError, 'argument must be a hash')
  end

  it 'must be created with at least one dish' do
    expect { ListOfDishes.new({}) }.to raise_error(ArgumentError, 'at least one dish must be specified')
  end
end
