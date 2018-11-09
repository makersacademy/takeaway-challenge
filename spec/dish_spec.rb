require 'dish'

describe Dish do
  subject { Dish.new('food', 2) }

  it 'shows the name when requested' do
    expect(subject.name).to eq('food')
  end

  it 'shows the price when requested' do
    expect(subject.price).to eq(2)
  end
  
end
