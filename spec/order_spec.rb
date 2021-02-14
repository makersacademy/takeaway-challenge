require 'order'

# potential for more functionality - adding several of one item at once.

describe Order do
  let(:twilio_adapter) { double(:twilio_adapter, :send_message => "sends a message") }
  let(:dish1) { { name: "Baked Potato", price: 3.25 } }
  let(:dish2) { { name: "Spaghetti Bolognese", price: 4.70 } }
  let(:test_menu) { double(:menu, :dishes => [dish1, dish2], :pick => dish1) }
  let(:test_order) { described_class.new(test_menu, twilio_adapter, '7777777777777') }

  describe '#initialize' do
    it 'has menu stored to menu attribute on initialization' do
      expect(test_order.menu).to eq test_menu
    end
    it 'has balance of zero' do
      expect(test_order.total).to match(/^£0.00$/)
    end
    it 'has empty list of dishes' do
      expect(test_order.dishes).to eq []
    end
    it 'is set to incomplete' do
      expect(test_order.complete).to be false
    end
  end

  describe '#add_item' do
    it 'adds a dish to the dishes array' do
      expect { test_order.add_item("Baked Potato") }.to change { test_order.dishes.length }.by 1
    end
    it 'throws an error if the order has already been finalized' do
      test_order.finalize
      expect { test_order.add_item(dish2) }.to raise_error "this order is closed"
    end
    it 'adds the price of the added item to the balance' do
      expect { test_order.add_item(dish1) }.to change { test_order.balance }.by dish1[:price]
    end
  end

  describe '#finalize' do
    it 'changes @complete from false to true' do
      expect { test_order.finalize }.to change { test_order.complete }.to true
    end
  end

  describe '#check_balance' do
    it 'prints a list of items ordered and total balance so user can check the sums' do
      expect { test_order.check_balance }.to output(String).to_stdout
    end
  end

end
