require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  context '#print' do

    it { is_expected.to respond_to(:print) }

    it 'creates a menu' do
      expect(menu.print).to be_a Hash
    end
  end
end
