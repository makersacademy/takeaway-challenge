require 'menu'

describe Menu do
  it 'should have a list of items by default' do
    expect(subject.food).not_to be_empty
  end

  it 'can show all items from the list' do
    expect(subject.show).to include("Big Mac 5.99")
  end

end
