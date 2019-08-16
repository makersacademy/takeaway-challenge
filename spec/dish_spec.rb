require 'dish'
describe Dish do
  subject(:subject) { described_class.new('Foo soup', 2) }

  it 'has a name' do
    expect(subject.name).to eq('Foo soup')
  end
  it 'has a price' do
    expect(subject.price).to eq(2)
  end
end
