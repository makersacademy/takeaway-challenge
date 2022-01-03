require 'dish'

describe Dish do 
  subject { described_class.new("jalfrezi", 12) }
  it 'has name' do
    expect(subject.name).to eq "jalfrezi"
  end

  it 'has price' do
    expect(subject.price).to eq 12
  end
end