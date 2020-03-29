require 'chips'

describe Chips do
  it 'initializes with name "Chips"' do
    expect(subject.name).to eq "Chips"
  end
  it 'initializes with price 5' do
    expect(subject.price).to eq 5
  end
end
