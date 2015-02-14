require 'menu'

describe Menu do
  
  let(:menu){ Menu.new "frosties",1 }

  it 'should be able to create a food item' do
    expect(menu.name).to eq "frosties"
  end

  it 'should be able to set a price for an item' do
    expect(menu.price).to eq 1
  end

end