require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'stores an array of dishes and prices' do
    expect(menu.dishes).to be_an_instance_of(Hash)
  end

end
