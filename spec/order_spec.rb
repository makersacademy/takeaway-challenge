require 'order'

describe Order do
  let(:message_response_double) { double(:response, error_code: nil) }
  let(:message_double) { double(:message, create: message_response_double) }
  let(:text_message_client_double) { double(:client, messages: message_double) }
  let(:text_message_client_class_double) { double(:client, new: text_message_client_double) }
  let(:order) { Order.new(text_message_client_class: text_message_client_class_double) }
  let(:dish) { double(:dish, to_s: 'Vegan Mixed Grill - £5.50', price: 5.5) }
  let(:menu) { double(:menu, get_dish: dish) }

  context 'when no dishes have been added to order' do
    describe '#check_order' do
      it 'returns nil' do
        expect(order.check_order).to be_nil
      end
    end
  end
  
  context 'when a dish has been added to order' do
    before { order.add_dishes_to_order(menu, 1, 2, 3) }
    
    describe '#check_order' do
      it 'returns a string showing the dishes and total cost' do
        expect(order.check_order).to eq("Vegan Mixed Grill - £5.50\nVegan Mixed Grill - £5.50\nVegan Mixed Grill - £5.50\nTOTAL: £16.50")
      end
    end

    describe '#submit_order' do
      it 'submits the order so that it can no longer be changed' do
        order.submit_order('555-555-5555')
        expect { order.add_dishes_to_order(menu, 1) }.to raise_error('Order has already been submitted.')
      end

      it 'send a confirmation text through Twilio' do
        expect(order.submit_order('555-555-5555')).to be_truthy
      end
    end
  end
end
