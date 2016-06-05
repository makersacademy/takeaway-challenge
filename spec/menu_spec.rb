require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe 'responds to' do
    it { is_expected.to respond_to :show }
  end

  describe '#show' do
    it 'shows a menu' do
      expect(menu.show).to include('chips' => 1, 'oreos' => 3, 'milkshake' => 2)
    end
  end
end
