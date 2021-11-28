require 'order'

describe MyOrder do 
  
  before do
    allow(subject).to receive(:send_text)
  end

  let(:bad_item) { 'DEFINITELY NOT AN ITEM ON THE MENU' }
  let(:good_item) { :'Spring Rolls' }
  let(:good_item_price) { 2.99 }
  context 'When initialized' do 
    it 'has an empty order basket' do 
      expect(subject.basket).to be_empty
    end
  end

  describe '#order' do 
    context 'item is on the menu' do 
      it 'adds the item to the basket' do 
        subject.order(good_item)
        expect(subject.basket.find { |item| item[good_item] }).to_not be_nil
      end
    end

    context 'item is not on the menu' do 
      it 'raises an error' do 
        expect { subject.order(bad_item) }.to raise_error "Item is not on the menu"
      end
    end

  end

  describe '#total' do 
    context 'nothing in the basket' do 
      it 'returns 0' do 
        expect(subject.total).to eq 0
      end
    end
    context 'items are in the basket' do 
      it 'returns the total cost of the order' do 
        subject.order(good_item)
        expect(subject.total).to eq good_item_price
      end
    end
  end

  describe '#confirm_order' do 
    context 'basket is empty' do 
      it 'raises an error' do 
        expect { subject.confirm_order }.to raise_error 'Basket is empty, cannot confirm order'
      end
    end
    context 'basket is not empty' do 
      
      it 'confirms order' do 
        subject.order(good_item)
        # INPUT TEST HERE
      end
    end
  end
end
