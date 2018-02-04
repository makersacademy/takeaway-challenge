require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize'
  it 'features a menu' do
    expect(menu.items).to be_instance_of Array
  end

  describe '#print_menu'
  it 'returns a menu of available items' do
    expect(menu.print_menu).to eq menu.items
  end
end
