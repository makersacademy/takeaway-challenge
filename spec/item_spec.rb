require 'item'

describe Item do
  subject { Item.new("test", 5) }

  it 'can create a new instance of an item with correct arguments' do
  expect(subject).to be_instance_of Item
  end

  it 'can return its name' do
    expect(subject.name).to eq("test")
  end

  it 'can return its price' do
    expect(subject.price).to eq(5)
  end

end
