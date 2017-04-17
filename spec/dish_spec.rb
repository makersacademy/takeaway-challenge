require 'dish'

describe Dish do

  subject { described_class.new('chilli', 5) }

  it 'should have a price' do
    expect(subject.price).to eq 5
  end

  it 'should have a name' do
    expect(subject.name).to eq 'chilli'
  end

end
