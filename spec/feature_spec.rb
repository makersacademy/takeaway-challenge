describe 'Features' do

  feature 'A customer visits' do

    let(:client) {TwilioClient.new}
    given!(:customer) {Customer.new(name: ENV['CUST_NAME'], method: client, identification: ENV['CUST_NUM'])}

    it 'and provides their details' do
      expect(customer.name).to eq ENV['CUST_NAME']
      expect(customer.method).to eq client
      expect(customer.identification).to eq ENV['CUST_NUM']

    end

    scenario 'to place an order' do

    end


  end
end
