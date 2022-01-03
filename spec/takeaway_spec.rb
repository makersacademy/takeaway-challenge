require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  
  it '#display_menu shows list of items and their cost' do
    expect { takeaway.display_menu }.to output("1. item1 - £1.0\n2. item2 - £2.0\n3. item3 - £3.0\n").to_stdout
  end

  it '#order_food adds food to pad' do
    takeaway.order_food(1, 1)
    expect { takeaway.display_order }.to output("1 x item1 - £1.0\nTotal cost: £1.0\n").to_stdout
  end

  it '#order_correct? returns true if #total matches #sum' do
    takeaway.order_food(1, 1)
    expect(takeaway.order_correct?).to be_truthy
  end

  it '#remove_food removes food' do
    takeaway.order_food(1, 2)
    takeaway.remove_food(1, 1)
    expect { takeaway.display_order }.to output("1 x item1 - £1.0\nTotal cost: £1.0\n").to_stdout
  end

  context '#complete_order' do
    before(:each) do
      takeaway.order_food(2, 3)
      allow(takeaway).to receive(:confirmation_text)
    end

    it 'clears order.pad' do
      takeaway.complete_order
      
      expect(takeaway.order.pad).to be_empty
    end

    it 'raises error if order is empty' do
      takeaway.remove_food(2, 3)

      expect { takeaway.complete_order }.to raise_error('Your order is empty!')
    end
  end
end
