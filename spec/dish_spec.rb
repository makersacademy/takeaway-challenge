require 'dish'

describe Dish do
  subject { described_class.new(name: 'Pizza', price:7.85)}
  it 'should create Pizza with price equalling 7.85' do
    expect(subject.name).to eq 'Pizza'
    expect(subject.price).to eq 7.85
  end
  
end
