require 'mash'

describe Mash do
  it 'initializes with name "Mash"' do
    expect(subject.name).to eq "Mash"
  end
  it 'initializes with price 4' do
    expect(subject.price).to eq 4
  end
end
