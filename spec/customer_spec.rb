require 'customer'

describe Customer do
  describe '#input_number' do
    it "asks for the customer's cellphone number" do
      new_customer = Customer.new
      allow(new_customer).to receive(:gets) {'15555555555'}
      expect{ new_customer.input_number }.to output("What number should we text a confirmation to?\n").to_stdout
    end
  end

  describe '#send_confirmation' do 
    it 'confirms text sent' do 
      expect{ subject.send_confirmation }.to output("A text has been sent confirming your order\n").to_stdout
    end
  end
end