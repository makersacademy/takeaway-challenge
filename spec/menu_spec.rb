require 'menu'

describe Menu do
  let(:hash) { { sausage: 0.5 } }
  let(:menu) { Menu.new(hash: hash) }

  it { is_expected.to respond_to(:hash).with(0).arguments }

  describe '#hash' do
    it 'returns a hash' do
      expect(menu.hash).to be_a Hash
    end
  end

end
