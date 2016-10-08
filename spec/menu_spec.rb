require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'initialises the menu' do
    expect(menu).to respond_to(:dishes)
  end

end
