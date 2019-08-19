require 'dish'
describe Dish do
  subject(:subject) { described_class.new('Foo soup', 2) }

  it 'has a name' do
    expect(subject.name).to eq('Foo soup')
  end
  it 'has a price' do
    expect(subject.price).to eq(2)
  end

  it 'can format its price' do
    expect(subject.print_price).to eq('£2.00')
  end
end
