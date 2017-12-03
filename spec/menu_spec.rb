require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#initialize' do
    it 'should be an instance of Menu class' do
      expect(menu).to be_an_instance_of(Menu)
    end

  it 'prints the menu' do
    expect(menu.print_menu).to eq(@pizza_menu)
  end

end
