require 'order'
require 'menu'

describe Order do
  subject(:order){described_class.new}
  let(:message){double(:message)}

  describe '#show_menu' do
   
   it 'should list availble dishes' do
    expect(order.show_menu).to eq(order.tidy_menu)
   end
  end

  describe '#choose' do
    it 'chooses a pizza' do
      expect(order).to respond_to(:choose).with(2).argument
    end

    it 'matches with an item' do
      allow(order).to receive(:choose) {"Margherita"}
      expect(MENU).to include(subject.choose)
    end
  end

  describe 'ordered_items' do

    it 'returns array of orderd items' do
        expect(order.ordered_items).to be_a Array
      end

      it 'includes items from the menu' do
        order.choose("Margherita",1)
        expect(order.ordered_items).to include("Margherita" => 1)
      end
  end

  describe '#total_cost' do
      
    it 'returns correct amount' do
      order.choose("Margherita",2)
      order.choose("Formaggio",1)
      expect(order.total_cost).to eq(36.97)
    end
  end

  describe '#check_total' do
   
    it 'returns itemised bill' do
     order.choose("Margherita",2)
     expect(order.check_total).to eq(["2.0 X Margherita(11.99) = 23.98"])
    end
  end

  describe '#send_message' do
    it {is_expected.to respond_to(:send_message)}
  end
end

















