require 'basket'

describe Basket do 

  context 'when adding to basket' do

    it 'contains added dish' do 
      expect { subject.add(:pierogi) }.to change { subject.items.count }.by(1)
    end
    it 'allows to add various quantity of the same dish' do 
      subject.add(:pierogi, 2)
      expect(subject.items[:pierogi]).to eq 2
    end
  end 

  describe '#total' do 
    let(:menu) { double :Menu }   
    before do 
      allow(menu).to receive(:dishes).and_return({ pierogi: 11.99 })
      subject.add(:pierogi)
    end 
    it 'calculates total price' do 
      expect(subject.total(menu)).to eq 11.99
    end
  end 
end 
