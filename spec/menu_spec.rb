require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe 'responds to' do
    it { is_expected.to respond_to :show }
    it { is_expected.to respond_to(:select).with(1).argument }
    it { is_expected.to respond_to(:select).with(2).arguments }
  end

  describe '#show' do
    it 'shows a menu' do
      expect(menu.show).to include('chips' => '£1', 'oreos' => '£3', 'milkshake' => '£2')
    end
  end

  describe '#select' do
    context 'when an unknown item is selected'
      it 'raises an error' do
        expect{menu.select('cake')}.to raise_error 'unknown item inputted, please enter an item on the menu'
      end
  end
end
