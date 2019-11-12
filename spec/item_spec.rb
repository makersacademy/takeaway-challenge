require 'item'

describe Item do
  subject { Item.new("test", 5) }

  it 'can create a new instance of an item with correct arguments' do
  expect(subject).to be_instance_of Item
  end


end
