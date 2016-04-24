require 'customer'

describe Customer do
  let(:customer) { described_class.new(takeaway) }
  let(:takeaway) { double(:takeaway, total_to_pay: 1) }

  describe '#checkout' do
    it 'raises and error if payment is incorrect' do
      message = "You have not paid the correct amount, please try again"
      expect{customer.checkout(2)}.to raise_error message
    end
  end

end
