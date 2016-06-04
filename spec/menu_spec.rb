require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe 'responds to' do
    it { is_expected.to respond_to :show }
    it { is_expected.to respond_to(:order).with(1).argument }
    it { is_expected.to respond_to(:order).with(2).arguments }
  end

  describe '#show' do
    it 'shows a menu' do
      expect(menu.show).to include('chips' => '£1', 'oreos' => '£3', 'milkshake' => '£2')
    end
  end

  describe '#order' do
    context 'when an unknown item is ordered'
      it 'raises an error' do
        expect{menu.order('cake')}.to raise_error 'unknown item inputted, please enter an item on the menu'
      end
  end
end
