require 'order'
require 'menu'

describe Order do
  subject(:order){described_class.new}

  describe '#show_menu' do
    it {is_expected.to respond_to(:show_menu)}

    it 'should list availble dishes' do
      expect(order.show_menu).to be_a String
    end
  end

  describe '#choose' do
    it 'chooses a pizza' do
      expect(order).to respond_to(:choose).with(1).argument
    end
    it 'matches with an item' do
      allow(subject).to receive(:choose) {"Margherita"}
      expect(MENU).to include(subject.choose)
    end
  end
end