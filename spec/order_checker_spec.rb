require 'order_checker'

describe OrderChecker do

  menu = [
      { dish: "Sea salt & caramel",      price: 3.5 },
      { dish: "Chilli & chocolate",      price: 3.5 },
      { dish: "Avocado cream",           price: 4.0 }
    ]

  let(:send_text) { double :text, send: true }
  subject { described_class.new(menu, send_text) }

  describe '#check_order' do

    context 'invalid order' do
      it 'raises error if invalid order item is included in array' do
        invalid_order = [{10=>1, 0=>3, 2=>4}, 12]
        expect { subject.check_order(invalid_order) }.to raise_error("Invalid dish selection!")
      end
    end

    context 'invalid total' do
      it 'raises error if invalid total is provided' do
        invalid_total   = [{0=>1, 1=>3, 2=>4}, 32]
        expect { subject.check_order(invalid_total) }.to raise_error("Incorrect order total provided!")
      end
    end

    context 'valid order' do

      before do
          @valid_order = [{0=>1, 1=>3, 2=>4}, 30]
      end

      it 'does not raise error' do
        expect { subject.check_order(@valid_order) }.not_to raise_error
      end

      it 'returns the calculated total' do
        expect { subject.check_order(@valid_order) }.to output("\"Total cost = £30\"\n").to_stdout
      end
    end
  end
end
