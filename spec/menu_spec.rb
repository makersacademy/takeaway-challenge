require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'contains a list of menu items' do
    expect(subject.menu).to(be_a(Hash))
  end

  describe '#read' do
    it 'returns the menu hash' do
      expect(menu.menu).to(be_a(Hash))
    end
  end

  describe '#print_menu' do
    it 'prints the menu items' do
      expect(menu.print_menu).to(have_key("Omlette"))
    end
  end

end
