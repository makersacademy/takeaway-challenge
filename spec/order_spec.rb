require 'order'
describe Order do
  let(:dish) { double :dish }
  let(:fiverdish) { double :fiverdish, price: 5 }
  let(:tennerdish) { double :tennerdish, price: 10 }
  describe '#add' do
    it 'can add a dish' do
      expect { subject.add(dish) }.to change(subject, :dishes).from([]).to([dish])
    end
  end

  describe '#remove' do
    before (:each) { subject.add(dish) }
    it 'can remove a dish' do
      expect { subject.remove(dish) }.to change(subject, :dishes).from([dish]).to([])
    end
  end

  describe '#total' do
    context 'there is one dish in the basket' do
      before (:each) { subject.add(fiverdish) }
      it 'totals an order with one dish' do
        expect(subject.total).to eq 5
      end

      context 'there are two dishes in the basket' do
        before(:each) { subject.add(tennerdish) }
        it 'totals a basket with multiple dishes' do
          expect(subject.total).to eq 15
        end
      end
    end
  end

  describe '#place' do
    context 'there is at least one dish in the basket' do
      before (:each) { subject.add(dish) }
      it 'tells user they have placed an order' do
        expect(subject.place).to eq("Thank you! Your order was placed and will be delivered soon.")
      end
    end
    
    context 'there are no dishes in the basket' do
      it 'tells user they have an empty basket' do
        expect(subject.place).to eq("Sorry, you have no items in your basket. Please add at least one before placing an order.")
      end
    end
  end
end
