require 'basket'

describe Basket do
  let(:dish) { double :dish, name: 'Steak', price: 25 }
  let(:dish2) { double :dish, name: 'Chips', price: 8 }
  let(:dish3) { double :dish, name: 'Caesar Salad', price: 9 }
  let(:menu) { double :menu, list: [dish, dish2, dish3], display: "1.) Steak - £25\n2.) Chips - £8\n3.) Caesar Salad - £9\n" }
  subject(:basket) { described_class.new(menu) }

  describe '#display_menu' do
    let(:pretty_print) { "1.) Steak - £25\n2.) Chips - £8\n3.) Caesar Salad - £9\n" }
    it 'prints a list of menu options and prices' do
      expect { basket.display_menu }.to output(pretty_print).to_stdout
    end
  end

  describe '#add_to_selection' do
    it 'adds a new order' do
      basket.add_to_selection(1)
      expect(basket.selection.items).to include(dish)
    end

    it 'accepts several selections of the same item' do
      basket.add_to_selection(1, 2)
      expect(basket.selection.items).to include(dish, dish)
    end
  end

  context 'adds one of each dish to basket' do
    before do
      basket.add_to_selection(1)
      basket.add_to_selection(2)
    end

    describe '#selection_total' do
      it 'prints the total price of all items in the basket' do
        expect { basket.selection_total }.to output("Your total is £33\n").to_stdout
      end
    end
  end
end
