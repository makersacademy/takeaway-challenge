require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context '#print_menu'
  it 'displays a list of available items' do
    expect(menu.print_menu)
  end
end
