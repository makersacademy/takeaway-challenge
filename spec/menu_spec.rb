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
end
