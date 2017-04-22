require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe '#list_dishes' do
    it { is_expected.to respond_to :list_dishes }

    context do
      it 'returns Brains from menu' do
        expect(menu.list_dishes).to include 'Brains'
      end
    end

  end
end
