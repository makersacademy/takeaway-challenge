require 'notification'

describe Notification do

  let(:green_curry) {double("Green Curry", name: "Green Curry", price: 5)}
  let(:penang_curry) {double("Penang Curry", name: "Penang Curry", price: 7)}

  let(:order) {double("Order", current: [{dish: green_curry, quantity: 2}, {dish: penang_curry, quantity: 1}], total: 17)}
  let (:client) {double(:client, messages: messages)}
  let (:messages) {spy(:messages)}

  subject(:notification) {described_class.new(order.current, order.total, client)}

  describe '#initialize' do

    it 'initializes with an order in it' do
      expect(notification.current_order).to eq order.current
    end

    it 'initializes with an order total in it' do
      expect(notification.current_order_total).to eq order.total
    end

  end

  describe '#summarise_order' do

    it 'shows a nicely formatted summary of the current order' do
      summary = "Thank you for your order!\nYou should receive it before #{Time.now.hour + 1}:#{Time.now.min}.\nHere's what you'll get:\n\n- 2x Green Curry @ £5 \n- 1x Penang Curry @ £7 \n\nTOTAL: £17"
      expect(notification.summarise_order).to eq summary
    end


  end

  describe '#client' do

    it 'initializes with a Twilio client' do
      expect(notification.client).to eq client
    end

  end
  
  describe '#send_sms' do

    it "sends the message" do
      notification.send_sms
      expect(messages).to have_received(:create)
    end

  end

end
