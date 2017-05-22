require 'menu'

describe Menu do

  before :each do
    @menu = Menu.new
  end

  it 'returns a Menu object' do
    expect(@menu).to be_an_instance_of Menu
  end

  it 'returns a hash of hashes' do
    expect(@menu.dishes).to respond_to(:keys)
    expect(@menu.dishes[1]).to respond_to(:keys)
  end

end
