require 'order'
require 'menu'

describe Order do
  subject(:order){described_class.new}

  describe '#show_menu' do
    it {is_expected.to respond_to(:show_menu)}

    it 'should list availble dishes' do
      expect(order.show_menu).to eq(order.tidy_menu)
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
        expect(subject.ordered_items).to be_a Array
      end
      it 'includes items from the menu' do
        subject.choose("Margherita",1)
        expect(subject.ordered_items).to include("Margherita" => 1)
      end
    end

    describe '#total_cost' do
      it 'returns total cost' do
       expect(subject).to respond_to(:total_cost)
      end
      it 'returns correct amount' do
       subject.choose("Margherita",2)
       subject.choose("Formaggio",1)
       expect(subject.total_cost).to eq(36.97)
      end
    end

  describe '#check_total' do
    it {is_expected.to respond_to(:check_total)}

    it 'returns itemised bill' do
      order.choose("Margherita",2)
      expect(order.check_total).to eq(["2.0 X Margherita(11.99) = 23.98"])
    end
  end




















end