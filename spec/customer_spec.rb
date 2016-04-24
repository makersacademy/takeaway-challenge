require 'customer'

describe Customer do
  let(:customer) { described_class.new(takeaway) }
  let(:takeaway) { double(:takeaway, total_to_pay: 1) }

  describe '#checkout' do
    it 'raises and error if payment is incorrect' do
      message = "Incorrect amount, please try again"
      expect{customer.checkout(2)}.to raise_error message
    end

    xit 'sends a confirmation message to the customer' do
      message = "Thank you! Your order was placed and will be delivered before 19:00"
      expect(customer).to receive(:send_text).with message
      customer.checkout(1)
    end
  end


end
