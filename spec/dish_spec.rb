require 'dish'

describe Dish do

  let(:name) { double :name }
  let(:price) { double :price }

  it 'reports its name' do
    subject = Dish.new(name, price)
    expect(subject.name).to eq(name)
  end

  it 'reports its price' do
    subject = Dish.new(name, price)
    expect(subject.price).to eq(price)
  end

end
