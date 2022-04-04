require 'dish'

describe Dish do
  
  subject { described_class.new("Pizza", 8) }

  it 'has a name' do
    expect(subject.name).to eq("Pizza")
  end

  it 'has a price' do
    expect(subject.price).to eq(8)
  end

end
