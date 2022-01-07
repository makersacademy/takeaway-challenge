require 'menu'

RSpec.describe Menu do

  describe '#add_dish' do
    context 'when dish is not yet in menu' do
      it 'adds a dish to the menu' do
        subject.add_dish('Chips', 10)
        expect(subject.menu).to eq({ 'Chips' => 10 })  
      end
    end
    context 'when dish is already in menu' do
      it 'updates the price' do
        subject.add_dish('Chips', 10)
        subject.add_dish('Chips', 20)
        expect(subject.menu).to eq({ 'Chips' => 20 })  
      end
    end
  end
end
