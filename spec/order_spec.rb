require 'order'

describe Order do
  let(:test_order) { { lobster: 1, nachos: 2 } }
  let(:test_list_data) { { burger: 15, lobster: 19, nachos: 5 } }
  let(:test_list) { double 'test_list', data: test_list_data }
  let(:test_total) { 29 }

  let(:twilio_test_creds) {
    { account_sid: ENV["TWILIO_TEST_SID"],
      auth_token:  ENV["TWILIO_TEST_TOKEN"],
      from_no: ENV["TWILIO_TEST_FROM"],
      to_no: ENV["MY_PHONE_NO"]
    }
  }

  subject(:order) { described_class.new(twilio_test_creds) }

  describe '#make' do
    it 'expected to place new orders' do
      expect { order.place({ list: test_list, order: test_order, total: test_total }) }.not_to raise_error
    end
  end

  describe '#total' do
    before { order.place({ list: test_list, order: test_order, total: test_total }) }
    it 'expected to calculate order total' do
      expect(order.total).to eq test_total
    end
  end
end
