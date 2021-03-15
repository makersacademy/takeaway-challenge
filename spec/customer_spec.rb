require 'customer'

describe Customer do
  let(:test_customer) { Customer.new }
  let(:test_number) { '08008888888' }
  let(:test_address) { { address: '72 Reunification Avenue, New Tokyo, UNC', post_code: '12NE XS9' } }
  let(:test_payment) { { type: 'credit_card', number: 0001_1100_1010_1000, expiry_date: '12/77', ccc: 888 } }

  describe '#number' do
    it 'provides the customers number' do
      expect(test_customer.number).to eq test_number
    end
  end

  describe '#address' do
    it 'provides the customers address' do
      expect(test_customer.address).to eq test_address
    end
  end

  describe '#payment' do
    it 'provides the customers payment details' do
      expect(test_customer.payment).to eq test_payment
    end
  end
end
