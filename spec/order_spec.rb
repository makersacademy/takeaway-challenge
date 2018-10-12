require 'order'

describe Order do
  let(:order) { Order.new }
  let(:pizza) { double(:pizza, price: 5, to_s: "pizza") }
  let(:pasta) { double(:pasta, price: 10, to_s: "pasta") }

  it 'has no dishes by default' do
    expect(order.dishes).to be_empty
  end

  it 'can be initialized with dishes' do
    order = Order.new([pizza, pasta])
    expect(order.dishes).to eq([pizza, pasta])
  end

  describe '#view' do
    it 'prints a summary of each unique dish in order with total' do
      order.add(pizza, pizza, pasta)
      expect { order.view }.to output("pizza x2 = £10\npasta x1 = £10\nTotal = £20\n").to_stdout
    end
  end

  describe '#add' do
    it 'adds a dish' do
      order.add(pizza)
      expect(order.dishes).to include(pizza)
    end
    it 'can add multiple different dishes' do
      order.add(pizza, pasta)
      expect(order.dishes).to include(pizza, pasta)
    end
    it 'can add multiple of the same dish' do
      order.add(pizza, pizza)
      expect(order.dishes).to eq [pizza, pizza]
    end
    it 'prints a summary of what was added' do
      expect { order.add(pizza, pizza) }.to output("Added pizza x2\n").to_stdout
    end
  end

  describe '#total' do
    it 'returns sum of dish prices' do
      order.add(pizza)
      order.add(pasta)
      expect(order.total).to eq 15
    end
  end

end
