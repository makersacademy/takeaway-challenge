require 'menu'

describe Menu do
subject(:menu) { described_class.new }

  it 'asks the menu for a list of dishes' do
    expect(menu).to respond_to(:list)
  end

  it 'returns a hash when asked for a list of dishes' do
     expect(menu.list).to be_an_instance_of(Hash)
   end


end

