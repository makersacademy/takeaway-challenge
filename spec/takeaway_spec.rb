require 'takeaway'

describe Takeaway do

subject(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'contains a menu' do
      expect(takeaway.menu).not_to be_nil
    end
  end

  describe '#complete_order' do
    it 'sends a confirmation message to the customer' do
      confirmation_message = "Thank you! Your order total of £19.0 was placed and will be delivered before #{takeaway.delivery_time}"
      allow(takeaway).to receive(:send_sms).with(confirmation_message).and_return(confirmation_message)
      expect(takeaway.complete_order(19.0)).to eq(confirmation_message)
    end
  end

end
