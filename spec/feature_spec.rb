require 'takeaway'

describe 'feature' do
  let(:takeaway) { Takeaway.new }
  # let(:fried_rice) { Dish.new("Fried rice", 6.50) }
  # let(:okonomiyaki) { Dish.new("Okonomiyaki", 11.00) }
  # let(:asian_fusion_dishes) do
  #   {
  #     "Fried rice" => fried_rice
  #     "Okonomiyaki" => okonomiyaki
  #   }
  # end
  let(:asian_fusion_takeaway) do
    fried_rice = Dish.new("Fried_rice", 6.50)
    okonomiyaki = Dish.new("Okonomiyaki", 11.00)
    asian_fusion_dishes = {
      "Fried_rice" => fried_rice,
      "Okonomiyaki" => okonomiyaki
    }
    Takeaway.new(asian_fusion_dishes)
  end
  context 'with default dishes' do
    context '#order' do
      it 'returns a friendly message when ordering a pizza' do
        skip if ENV['TWILIO_ENABLED'] != '1'

        expect(takeaway.order("Pizza *1", 1.50)).to include('Thank you! Your order was placed and will be delivered before', 'You will also receive a text message with these details')
      end
      it 'returns a friendly message when ordering various things' do
        skip if ENV['TWILIO_ENABLED'] != '1'

        expect(takeaway.order("Pizza *1, Sushi *2", 33.50)).to include('Thank you! Your order was placed and will be delivered before', 'You will also receive a text message with these details')
      end
      it 'raises an error with an invalid input' do
        expect { takeaway.order("Pizza*1", 1.50) }.to raise_error(OrderHandler::ERROR_MESSAGE)
      end
      it 'raises an error with an incorrect amount' do
        expect { takeaway.order("Pizza *1", 1) }.to raise_error(OrderHandler::ERROR_MESSAGE)
      end
    end
    
    context '#dishes' do
      it 'returns a friendly list of dishes' do
        expect(takeaway.dishes).to eq("Pizza: £1.50\nSushi: £16.00\n")
      end
    end
  end

  context 'with a different list of dishes' do
    context '#order' do
      it 'returns a friendly message when ordering an okonomiyaki' do
        skip if ENV['TWILIO_ENABLED'] != '1'

        expect(asian_fusion_takeaway.order("Okonomiyaki *1", 11.00)).to include('Thank you! Your order was placed and will be delivered before', 'You will also receive a text message with these details')
      end
      it 'returns a friendly message when ordering various things' do
        skip if ENV['TWILIO_ENABLED'] != '1'

        expect(asian_fusion_takeaway.order("Fried_rice *1, Okonomiyaki *2", 28.50)).to include('Thank you! Your order was placed and will be delivered before', 'You will also receive a text message with these details')
      end
      it 'raises an error with an invalid input' do
        expect { asian_fusion_takeaway.order("Pizza *1", 1.50) }.to raise_error(OrderHandler::ERROR_MESSAGE)
      end
      it 'raises an error with an incorrect amount' do
        expect { asian_fusion_takeaway.order("Okonomiyaki *1", 10.00) }.to raise_error(OrderHandler::ERROR_MESSAGE)
      end
    end
    
    context '#dishes' do
      it 'returns a friendly list of dishes' do
        expect(asian_fusion_takeaway.dishes).to eq("Fried_rice: £6.50\nOkonomiyaki: £11.00\n")
      end
    end
  end
end
