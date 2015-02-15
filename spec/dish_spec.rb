require './lib/dish'


describe Dish do

  let(:dish) {Dish.new('Garden salad','Side dish',10)}

  it 'should have a name' do
    expect(dish.info[:name]).to eq('Garden salad')
  end

  it 'should be have a price' do
    expect(dish.info[:price]).to eq(10)
  end
  
  it 'should be assigned to a category' do
    expect(dish.info[:category]).to eq(:'Side dish')
  end

end