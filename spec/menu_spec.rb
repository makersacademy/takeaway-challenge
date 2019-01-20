require 'menu'

describe Menu do
  describe '#display' do
    it 'displays all dishes in the menu list' do
      expect { subject.display }.to output("Menu List:\n1. Curry - £5\n2. Rice - £2\n3. Naan bread - £2\n").to_stdout
    end
  end

  describe '#choose' do
    it 'returns the name and price of the dish' do
      expect(subject.choose(1)).to eq({ number: 1, name: 'Curry', price: 5, quantity: 1 })
    end
  end
end
