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
      expect(order).to respond_to(:choose).with(2).argument
    end
    it 'matches with an item' do
      allow(subject).to receive(:choose) {"Margherita"}
      expect(MENU).to include(subject.choose)
    end
  end

  describe 'ordered_items' do
      it {is_expected.to respond_to(:ordered_items)}

      it 'returns array of orderd items' do
        expect(subject.ordered_items).to be_a Hash
      end
      it 'includes items from the menu' do
        subject.choose("Margherita",1)
        expect(subject.ordered_items).to include("Margherita" => 1)
      end
    end
end