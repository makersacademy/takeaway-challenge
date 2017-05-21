require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish, name: 'fried chicked' }

  it { expect(menu).to respond_to :read_menu }

  describe '#default_menu' do
    it 'checks if menu is initialized with default dishes' do
      expect(menu.read_menu.first).to eq 'fried chicken'
    end
  end

  it 'allows to check if a dish is on the menu' do
    expect(menu.contains?(:dish)).not_to be
  end

  describe '#read_menu' do
    it 'allows to read the full menu' do
      expect(menu.read_menu.count).to eq 6
    end
  end

end
