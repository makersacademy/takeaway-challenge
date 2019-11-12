require 'item'

describe Item do

  it 'can create a new instance of an item' do
  subject.new("test item", 5)
  expect(subject).to be_instance_of Item
  end


end
