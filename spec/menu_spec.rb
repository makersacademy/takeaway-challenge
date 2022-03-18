require './lib/menu'

describe Menu do
  subject(:menu) { described_class.new }
  it 'it is created with a list of dishes' do
    expect(menu.dishes).to be_a_kind_of(Hash) 
  end 

end
