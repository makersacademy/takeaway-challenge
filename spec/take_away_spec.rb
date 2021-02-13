require 'take_away'

describe TakeAway do 
  # let(:dishes) { double :Dishes, pierogi: 11.99 }
  let(:menu) { double :Menu } 
  subject { described_class.new(menu) }

  before do 
    allow(menu).to receive(:dishes).and_return({ pierogi: 11.99 })
  end 

  it 'displays a list of all available dishes' do 
    expect(subject.read_menu).to eq({ pierogi: 11.99 })
  end

  context 'when adding to basket' do

    it 'allows to add dish' do 
      expect { subject.add_to_basket(:pierogi) }.to change { subject.basket.count }.by(1)
    end
    it 'allows to add various quantity of the same dish' do 
      subject.add_to_basket(:pierogi, 2)
      expect(subject.basket[:pierogi]).to eq 2
    end
    it 'raises an error when dish is not in the menu' do 
      expect { subject.add_to_basket(:fish) }.to raise_error "fish is not available"
    end
  end 

  context 'when checking out' do 
    before do 
      subject.add_to_basket(:pierogi, 2)
    end
    it 'checks if payment is equal to the total price of all items in the basket' do 
      expect { subject.checkout(23.98) }.not_to raise_error 
    end
    it 'raises an error when payment is not equal to the total price of all item in the basket' do 
      expect { subject.checkout(10.00) }.to raise_error "Incorrect amount"
    end
  end
end 
