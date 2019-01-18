require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it { is_expected.to respond_to(:menu).with(0).arguments }

  describe '#menu' do
    it 'returns a hash' do
      expect(menu.menu).to be_a Hash
    end
  end

end
