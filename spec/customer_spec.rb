require 'customer'

describe Customer do
  let(:new_customer) { Customer.new('+15005550006') }
  describe '#input_number' do
    it "asks for the customer's cellphone number" do
      allow(new_customer).to receive(:gets) { '15555555555' }
      expect { new_customer.input_number }.to output("What number should we text a confirmation to?\n").to_stdout
    end
  end

  describe '#send_confirmation' do 
    it 'confirms text sent' do 
      expect { subject.send_confirmation }.to output("A text has been sent confirming your order\n").to_stdout
    end
    it 'confirms that a text has been sent' do 
      expect(new_customer).to receive(:send_text)
      new_customer.send_confirmation
    end
  end

  describe '#send_text' do
    let(:message_double) { double :message }
    let(:client_double) { double :client, messages: message_double }
    let(:client_class_double) { double :client_class, new: client_double }

    it 'sends a text' do 
      expect(message_double).to receive(:create)
      new_customer.send_text(client_class_double)
    end
  end
end
