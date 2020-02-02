require 'order'

describe Order do
  it 'should create an order with a reference' do
    expect(subject.reference).to be_an(Integer)
  end
  it 'should create an order with a list for dishes' do
    expect(subject.dishes_list).to be_an(Array)
  end
end