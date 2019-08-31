require 'dish'

describe Dish do
  subject { Dish.new('some dish', 8.0) }

  it 'shoule be initialized with name' do
    expect(subject.name).to eq('some dish')
  end

  it 'should be initialized with price' do
    expect(subject.price).to eq(8.0)
  end
end
