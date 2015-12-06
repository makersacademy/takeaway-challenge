require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should initialize with an empty menu_list' do
    expect(menu.menu_list).to be empty
  end


end
