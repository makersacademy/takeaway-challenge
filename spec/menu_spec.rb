require 'menu'

describe Menu do
  let(:order) { [['Margherita', 1], ['Meat Feast', 2]] }
  describe '#select' do
    it 'should respond to the select method' do
      expect(subject).to respond_to :select
    end

    it 'should return the items ordered along with their quantities' do
      expect(subject.select(order)).to eq [{ name: 'Margherita', quantity: 1 }, { name: 'Meat Feast', quantity: 2 }]
    end
  end

  describe '#to_string' do
    let(:menu_string) { "Margherita, £5.50\nPepperoni, £6.00\nVeggie, £6.50\nHawaiian, £6.50\nMeat Feast, £7.50" }
    it 'should return the menu in a readable format' do
      expect(subject.to_string).to eq menu_string
    end
  end
end
