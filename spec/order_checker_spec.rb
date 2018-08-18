require 'order_checker'

describe OrderChecker do

  before do
    @menu = [
      { dish: "Sea salt & caramel",      price: 3.5 },
      { dish: "Chilli & chocolate",      price: 3.5 },
      { dish: "Avocado cream",           price: 4.0 },
      { dish: "Coconut",                 price: 3.0 },
      { dish: "Praline",                 price: 3.7 },
      { dish: "Watermelon sorbet",       price: 3.5 },
      { dish: "Wild strawberry",         price: 4.5 },
      { dish: "Dark chocolate & cherry", price: 5.5 }
    ]
  end

  describe '#check_order' do

    context 'invalid order' do
      it 'raises error if invalid order item is included in array' do
        order_array = [[10,1], [1,3], [3,4]]
        expect { subject.check_order(@menu, order_array) }.to raise_error("Invalid dish selection!")
      end
    end

    context 'valid order' do



      it 'does not raise error' do
        order_array = [[7,1], [1,3], [3,4]]
        expect { subject.check_order(@menu, order_array) }.not_to raise_error
      end

      it 'returns the calculated total' do

      end
    end
  end
end
