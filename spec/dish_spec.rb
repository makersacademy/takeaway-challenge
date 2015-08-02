require 'dish'

describe Dish do
  it 'takes a price' do
    subject = Dish.new :beef_ragu, 9.99
    expect(subject.price).to eq 9.99
  end

  it 'takes a name' do
    subject = Dish.new :beef_ragu, 9.99
    expect(subject.name).to eq :beef_ragu
  end
end
