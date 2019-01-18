require 'menu'

describe Menu do
  subject(:burger_menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      chicken: 2.99,
      beef: 3.49,
      veggie: 1.99,
      fries: 1.50
    }
  end

  describe '#new' do
    it 'Initialises with argument dishes' do
      expect(burger_menu.dishes.count).to eq 4
    end
  end

  describe '#Print Menu' do
    it 'Should print a list of dishes with relevant prices' do
      expect(burger_menu.print_menu).to eq "Chicken £2.99, Beef £3.49, Veggie £1.99, Fries £1.50"
    end
  end
end
