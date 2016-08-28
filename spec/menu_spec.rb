require 'menu'

describe Menu do

subject(:menu) { described_class.new }

  it 'should initialize with a menu' do
  expect(menu.items).to include ("Nasty Noodles")
  end

end
