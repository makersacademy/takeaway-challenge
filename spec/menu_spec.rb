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
    it "accepts an item from the menu and a quantity" do
      expect{menu.order('milkshake', 4)}.to_not raise_error
    end
    context 'when no quantity is inputted' do
      it 'should assume a default input of 1' do
        expect{menu.order('chips')}.to_not raise_error
      end
    end
    context 'when an unknown item is ordered'
      it 'raises an error' do
        expect{menu.order('cake', 4)}.to raise_error 'unknown item inputted, please enter an item on the menu'
      end
  end
end
