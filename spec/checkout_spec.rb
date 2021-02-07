require 'checkout'

describe Checkout do 

  describe 'calculates the sum total of the order' do
    it 'returns the sum of a single order' do
      single_order = [{ dish: 'Grilled Salmon with Mayonnaise Sauce', price: 16.95 }]
      expect(subject.order_checkout(single_order)).to eq(16.95)
    end

    it 'calculates the sum total of multiple orders' do
      multiple_order = [{ dish: 'Fritto Misto di Calamari', price: 17.45 },
                { dish: 'Vitello Milanese', price: 16.55 }]
      expect(subject.order_checkout(multiple_order)).to eq(34)
    end
  end
end
