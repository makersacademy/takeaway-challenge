require 'customer_notification'
require 'twilio_client'

describe CustomerNotification do
  let(:customer) {double :customer, phone_number: "07730655323", name: "Joe Maidman"}
  let(:order) {double :order, total_bill: 50, time_placed: Time.now}
  let(:body) {"Thank you for your order #{customer.name}!
  It will be delivered before #{(order.time_placed + (60 * 60)).strftime('%r')}"}



  context 'When customer has a SMS notification type' do
  subject(:notification) {described_class.new(customer, order, TwilioClient.new)}

    describe '#order'  do
      it 'has an order' do
        expect(notification.order).to eq order
      end
    end

    describe '#customer'  do
      it 'has a customer' do
        expect(notification.customer).to eq customer
      end
    end

    describe '.notify' do
      it 'sends a notification' do
        expect(notification).to respond_to(:notify)
      end
    end

    describe '.sent?' do
      it 'returns false until notification sent' do
        expect(notification.sent?).to eq false
      end
    end

    #Note that this test actually sends an SMS!!
    # describe '.sent?' do
    #   it 'returns true afer notification sent' do
    #     notification.notify
    #     expect(notification.sent?).to eq true
    #   end
    # end

  end

  context 'When customer has a Email notification type' do
  subject(:notification) {described_class.new(customer, order, EmailClient.new)}

    describe '#order'  do
      it 'has an order' do
        expect(notification.order).to eq order
      end
    end

    describe '#customer'  do
      it 'has a customer' do
        expect(notification.customer).to eq customer
      end
    end

    describe '.notify' do
      it 'sends a notification' do
        expect(notification).to respond_to(:notify)
      end
    end

    describe '.sent?' do
      it 'returns false until notification sent' do
        expect(notification.sent?).to eq false
      end
    end

    #Note that this test actually sends an Email!!
    # describe '.sent?' do
    #   it 'returns true afer notification sent' do
    #     notification.notify
    #     expect(notification.sent?).to eq true
    #   end
    # end

  end




end
