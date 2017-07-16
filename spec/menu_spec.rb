require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'responds to dishes' do
    expect(menu).to respond_to(:dishes)
  end

  it 'responds to read_menu' do
    expect(menu).to respond_to(:read_menu)
  end

end
