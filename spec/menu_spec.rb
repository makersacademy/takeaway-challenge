require 'menu'

describe Menu do

  it 'stores a list of dishes and their prices as a hash' do
    expect(subject.menu).to be_an_instance_of(Hash)
  end

  it 'can check if an item exists' do
    expect(subject.item_exists?("Chicken Gyoza")).to be true
  end

end
