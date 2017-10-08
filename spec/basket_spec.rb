require 'basket'

describe Basket do

  dish1, dish1_price = 'wonton', 3.50
  dish2, dish2_price = 'seaweed', 5.50
  menu_items = { dish1 => dish1_price, dish2 => dish2_price }

  let(:menu) { double('menu', print: nil, items: menu_items) }
  subject(:basket) { described_class.new }

  describe '#add' do

    it 'adds an item to the basket' do
      expect(basket.add(dish1, dish1_price)).to include [dish1, dish1_price] 
    end

  end

  describe '#total' do

    it 'calculates the total cost of an order' do
      basket.add(dish1, dish1_price)
      expect { basket.add(dish2, dish2_price) }.to change { basket.total }.by dish2_price
    end
    it 'raises error if no items have been added' do
      error = 'no items have been added to the basket'
      expect { basket.total }.to raise_error error
    end

  end

  describe '#summary' do

    context 'given some items are in the basket' do

      before { basket.add(dish1, dish1_price) }

      it 'prints the summary as a string' do
        str = "1 #{dish1} = £#{dish1_price}\n"
        expect { basket.summary }.to output(str).to_stdout
      end
      it 'prints multiple items as a list' do
        basket.add(dish2, dish2_price)
        str = "1 #{dish1} = £#{dish1_price}\n1 #{dish2} = £#{dish2_price}\n"
        expect { basket.summary }.to output(str).to_stdout
      end
      it 'combines multiple similar items' do
        basket.add(dish1, dish1_price)
        str = "2 #{dish1} = £#{2 * dish1_price}\n"
        expect { basket.summary }.to output(str).to_stdout
      end

    end

    context 'given no items are in the basket' do
    
      it 'raises an error if no items have been added' do
        error = 'no items have been added to the basket'
        expect { basket.summary }.to raise_error error     
      end
      
    end

  end

  describe '#reset' do

    it 'empties the basket' do
      basket.add(dish1, dish1_price)
      basket.reset
      error = 'no items have been added to the basket'
      expect { basket.summary }.to raise_error error   
    end

  end

end
