require 'order_checker'

describe OrderChecker do

  menu = [
      { dish: "Sea salt & caramel",      price: 3.5 },
      { dish: "Chilli & chocolate",      price: 3.5 },
      { dish: "Avocado cream",           price: 4.0 },
      { dish: "Coconut",                 price: 3.0 },
      { dish: "Praline",                 price: 3.7 },
      { dish: "Watermelon sorbet",       price: 3.5 },
      { dish: "Wild strawberry",         price: 4.5 },
      { dish: "Dark chocolate & cherry", price: 5.5 }
    ]
  order_array_invalid = [[[10, 1], [1, 3], [3, 4]], 12]
  order_array_valid   = [[[7, 1], [1, 3], [3, 4]], 31]
  order_array_total   = [[[7, 1], [1, 3], [3, 4]], 30]
  let(:send_text) { double :text, send: true }
  let(:invalid_order) { described_class.new(menu, order_array_invalid, send_text) }
  let(:valid_order)   { described_class.new(menu, order_array_valid, send_text) }
  let(:invalid_total) { described_class.new(menu, order_array_total, send_text) }

  describe '#check_order' do

    context 'invalid order' do
      it 'raises error if invalid order item is included in array' do
        expect { invalid_order.check_order }.to raise_error("Invalid dish selection!")
      end
    end

    context 'invalid total' do
      it 'raises error if invalid total is provided' do
        expect { invalid_total.check_order }.to raise_error("Incorrect order total provided!")
      end
    end

    context 'valid order' do
      it 'does not raise error' do
        expect { valid_order.check_order }.not_to raise_error
      end

      it 'returns the calculated total' do
        expect { valid_order.check_order }.to output("\"Total cost = £31\"\n").to_stdout
      end
    end
  end
end
