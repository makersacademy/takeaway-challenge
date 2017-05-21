require './lib/menu.rb'

describe Menu do
  let(:real_menu) { described_class.new }
  let(:menu) { real_menu.menu }

  describe '#initialize' do
    it 'is initialized with menu' do
      expect(real_menu.menu).to eq menu
    end
  end
end
