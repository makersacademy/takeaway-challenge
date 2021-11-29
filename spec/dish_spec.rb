require 'dish'

describe Dish do
  subject { described_class.new("Chips", 2.50) }
  it 'can display its name' do
    expect(subject.name).to eq "Chips"
  end

  it 'can display its price' do
    expect(subject.price).to eq 2.50
  end
end