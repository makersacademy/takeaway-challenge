require 'dish'

describe Dish do
  subject(:dish) { described_class.new("Test", 5) }

  it 'should be initialized with a name' do
    expect(subject.name).not_to be_nil
  end

  it 'should be initialized with a price' do
    expect(subject.price).not_to be_nil
  end
end
