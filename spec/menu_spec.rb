require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish, name: "Green Curry", price: 5 }
  let(:other_dish) { double :dish, name: "Red Curry", price: 6 }
  context 'when empty' do
    describe '#list' do
      it 'should raise an error if list is empty' do
        expect { menu.list }.to raise_error 'Error: Menu has no items'
      end
    end
  end

  context 'when not empty' do
    describe '#list' do
      it 'should return the list of dishes and prices' do
        4.times { menu.add_dish(dish) }
        expect(menu.list).to include(dish)
      end
    end
    describe '#order' do
      it 'should return the dish a user has ordered' do
        menu.add_dish(dish)
        menu.add_dish(other_dish)
        expect(menu.order(1)).to eq dish
      end
      it 'should raise an error if a valid option was not chosen' do
        menu.add_dish(dish)
        menu.add_dish(other_dish)
        expect { menu.order(4) }.to raise_error 'Error: Not a valid option'
      end
    end

  end

end
