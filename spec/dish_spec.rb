require 'dish'

describe Dish do
  let(:name) { "McNuggets" }
  let(:price) { 3.00 }
  subject { described_class.new(name, price) }

  it 'has a name' do
    expect(subject.name).to eq name
  end

  it 'has a price' do
    expect(subject.price).to eq price
  end
end
