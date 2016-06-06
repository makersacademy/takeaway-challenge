require 'menu'

describe Menu do
  let(:dish) { double(:dish, name: "Chicken Balti", price: 5.99) }

  describe '#add' do
    context 'when adding to the menu' do
      it 'can have a dish added' do
        subject.add(dish)
        expect(subject.dishes).to include dish
      end
    end
  end

  describe '#has_dish?' do
    context 'when dish isn\'t available to order' do
      it 'returns false' do
        expect(subject.has_dish?(dish)).to eq false
      end
    end

    context 'when dish is available to order' do
      it 'returns true' do
        subject.add(dish)
        expect(subject.has_dish?(dish)).to eq true
      end
    end
  end
end
