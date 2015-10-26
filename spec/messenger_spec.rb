require 'messenger'

describe Messenger do

  context "#send_text" do

    it 'sends a payment confirmation text message' do
      allow(subject).to receive(:send_text)
      expect(subject).to receive(:send_text).with("Thank you for your order: £27.50")
      takeaway.checkout(27.50)
    end
  end
end