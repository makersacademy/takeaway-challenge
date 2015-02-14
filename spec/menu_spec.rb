require 'menu'

describe Menu do
  
  let(:menu){ Menu.new }

  it 'should be able to create a food item' do
    frosties = Menu.new("frosties")
    expect(frosties.name).to eq "frosties"
  end

  it 'should be able to set a price for an item' do
    frosties = Menu.new("frosties",2)
    expect(frosties.price).to eq 2
  end

end