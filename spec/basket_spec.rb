require 'basket'

describe Basket do

  let(:dish1) { 'wonton' }
  let(:dish1_price) { 4.00 }
  let(:dish2) { 'seaweed' }
  let(:dish2_price) { 3.50 }
  let(:menu) { double('menu', print: nil, items: { dish1 => dish1_price, dish2 => dish2_price }) }
 
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

    it 'prints the summary to stdout as a string' do
      basket.add(dish1, dish1_price)
      str = "1 #{dish1} = £#{dish1_price}\n"
      expect { basket.summary }.to output(str).to_stdout
    end
    it 'prints multiple items as a list' do
      basket.add(dish1, dish1_price)
      basket.add(dish2, dish2_price)
      str = "1 #{dish1} = £#{dish1_price}\n1 #{dish2} = £#{dish2_price}\n"
      expect { basket.summary }.to output(str).to_stdout
    end
    it 'combines multiple items that are the same' do
      basket.add(dish1, dish1_price)
      basket.add(dish1, dish1_price)
      str = "2 #{dish1} = £#{2 * dish1_price}\n"
      expect { basket.summary }.to output(str).to_stdout
    end

  end

end
