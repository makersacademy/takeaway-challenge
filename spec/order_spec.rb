require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) do
    double(:menu,
    check_price: 0.99,
    calculate_subtotal: [['Spring Rolls', 10, 9.90]])
  end

  before do
    allow(STDOUT).to receive(:puts)
  end

  context 'Initialization' do
    it 'Has an empty basket on Initialization' do
      expect(order.instance_variable_get(:@basket)).to be_empty
    end
    it 'Accepts a menu for the order' do
      expect(order.instance_variable_get(:@menu)).to eq menu
    end
  end

  describe '#order' do
    it 'Adds a single item to the order' do
      order.add_to_order('Spring Rolls')
      expect(order.instance_variable_get(:@basket)).to eq('Spring rolls' => 1)
    end
    it 'Adds a quantity of item to the order' do
      order.add_to_order('Spring Rolls', 4)
      expect(order.instance_variable_get(:@basket)).to eq('Spring rolls' => 4)
    end
    it 'Aggregates similar items' do
      order.add_to_order('Spring Rolls')
      order.add_to_order('spring rOlls', 4)
      expect(order.instance_variable_get(:@basket)).to eq('Spring rolls' => 5)
    end
    it 'Checks items are on menu' do
      expect(menu).to receive(:check_price).with('Spring Rolls')
      order.add_to_order('Spring Rolls')
    end
    it 'Adds price to total' do
      order.add_to_order('Spring Rolls')
      expect(order.instance_variable_get(:@total)).to eq 0.99
    end
  end

  describe '#review_order' do
    it 'Delegates subtotal to menu' do
      var = order.instance_variable_get(:@basket)
      expect(menu).to receive(:calculate_subtotal).with(var)
      order.review_order
    end
    specify { expect { order.review_order }.to output.to_stdout }
  end

  describe '#checkout' do
    before do
      order.add_to_order('Spring Rolls', 10)
      @err = 'Please review payment amount'
    end
    it 'Checks payment_amount is equal to total' do
      expect { order.checkout(9.90) }.not_to raise_error
    end
    it 'Raises flag if payment is insufficient' do
      expect { order.checkout(1.00) }.to raise_error @err
    end
    it 'Raises flag if payment is too big' do
      expect { order.checkout(100.00) }.to raise_error @err
    end
    specify { expect { order.checkout(9.90) }.to output.to_stdout }
  end
end
