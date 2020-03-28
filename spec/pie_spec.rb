require 'pie'

describe Pie do
  it 'initializes with name "Pie"' do
    expect(subject.name).to eq "Pie"
  end
  it 'initializes with price 6' do
    expect(subject.price).to eq 6
  end
end
