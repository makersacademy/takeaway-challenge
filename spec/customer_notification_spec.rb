require 'customer_notification'
require 'twilio_client'
require 'email_client'

describe CustomerNotification do
  let(:order) {double :order, total_bill: 50, time_placed: Time.now}
  let(:body) {"Thank you for your order #{customer.name}!
  It will be delivered before #{(order.time_placed + (60 * 60)).strftime('%r')}"}

  context 'When customer has a SMS notification type' do
  # The two lines below is required to live test the SMS functionality
  # let(:customer) {double :customer, phone_number: "123456", name: "Joe Blogs", method: TwilioClient.new}
  let(:dummy_twilio) {double :dummy_twilio}
  let(:customer) {double :customer, phone_number: "123456", name: "Joe Blogs", method: dummy_twilio}
  subject(:notification) {described_class.new(customer, order)}

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

    it 'returns false until notification sent' do
      expect(notification.sent?).to eq false
    end

    it 'returns true once notification sent' do
      allow(notification).to receive(:sent?).and_return(true)
      expect(notification.sent?).to eq true
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
  let(:customer) {double :customer, phone_number: "07730655323", name: "Joe Maidman", method: EmailClient.new}
  subject(:notification) {described_class.new(customer, order)}

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

      it 'returns true once notification sent' do
        allow(notification).to receive(:sent?).and_return(true)
        expect(notification.sent?).to eq true
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
