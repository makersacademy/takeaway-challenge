require 'basket'

describe Basket do
  subject(:basket) { described_class.new }
  let(:one_selection) { [{ dish: "Steak", price: 25, quantity: 1 }] }
  let(:selections) { [{ dish: "Steak", price: 25, quantity: 1
    }, { dish: "Chips", price: 8, quantity: 2 }] }

  describe '#initialize' do
    it 'it is created with 0 selections in it' do
      expect(basket.selections).to eq []
    end
  end

  describe '#add_dish' do
    it 'adds first selection into the basket' do
      expect(basket.add_dish(dish: "Steak", price: 25, quantity: 1)).to eq one_selection
    end

    it 'can add multiple selections into the basket' do
      basket.add_dish(dish: "Steak", price: 25, quantity: 1)
      basket.add_dish(dish: "Chips", price: 8, quantity: 2)
      expect(basket.selections).to eq selections
    end
  end

  describe '#display_summary' do
    let(:pretty_print) { "Steak x 1 = £25\nChips x 2 = £16\nCaesar Salad x 3 = £27\n" }
    it 'pretty prints all dishes selected by customer' do
      basket.add_dish(dish: "Steak", price: 25, quantity: 1)
      basket.add_dish(dish: "Chips", price: 8, quantity: 2)
      basket.add_dish(dish: "Caesar Salad", price: 9, quantity: 3)
      expect { basket.display_summary }.to output(pretty_print).to_stdout
    end
  end

  describe '#display_total' do
    let(:print_total) { "Your total is £68.\n" }
    it 'prints total order cost' do
      basket.add_dish(dish: "Steak", price: 25, quantity: 1)
      basket.add_dish(dish: "Chips", price: 8, quantity: 2)
      basket.add_dish(dish: "Caesar Salad", price: 9, quantity: 3)
      basket.total_cost
      expect { basket.display_total }.to output(print_total).to_stdout
    end
  end

  describe '#total_cost' do
    it 'calculates the total cost of the order' do
      basket.add_dish(dish: "Steak", price: 25, quantity: 1)
      basket.add_dish(dish: "Chips", price: 8, quantity: 2)
      basket.add_dish(dish: "Caesar Salad", price: 9, quantity: 3)
      expect(basket.total_cost).to eq 68
    end
  end
end
