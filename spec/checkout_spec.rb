require 'checkout'

describe Checkout do
  let(:user_prompt) { "Please enter your phone number to complete the order:\n" + "+44 " }
  let(:confirmation_prompt) { "Your order is on it's way! Please check your phone for confirmation.\n" }

  describe '#place_order' do
    it { is_expected.to respond_to(:place_order) }

    it 'prompts the user for their phone number' do
      allow(subject).to receive(:gets).and_return("1234567890")
      allow(subject).to receive(:send_sms)
      allow(subject).to receive(:confirmation)
      expect { subject.place_order }.to output(user_prompt).to_stdout
    end

    it 'confirms once they have placed their order' do
      allow(subject).to receive(:request_number)
      allow(subject).to receive(:send_sms)
      expect { subject.place_order }.to output(confirmation_prompt).to_stdout
    end
  end
end