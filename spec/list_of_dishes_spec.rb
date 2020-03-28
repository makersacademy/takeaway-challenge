require 'list_of_dishes'

describe ListOfDishes do
  let(:dishes) { double(:dishes) }

  it 'see a list when its empty' do
    list = ListOfDishes.new([])
    expect(list.see).to eq([])
  end

  it 'see a list when there are dishes in it' do
    list = ListOfDishes.new(dishes)
    expect(list.see).to eq(dishes)
  end
end
