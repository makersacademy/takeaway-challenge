require 'customer_interface'

describe Interface do
  subject(:interface){described_class.new}
  let(:customer_input) { "hello" }

  describe '#request_input' do
    it "should request input from the customer'" do
      hello = interface.request_input(customer_input)
      expect(hello).to eq "hello"
    end
  end
end
