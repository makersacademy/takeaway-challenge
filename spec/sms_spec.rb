require 'sms'

describe SMS do

  let(:messages) { double(:messages) }

  subject { SMS.new(messages) }

  before do
    allow(messages).to receive(:create)
  end

  describe '.send' do

    context 'method call' do
      specify {
        expect(subject).to respond_to(:send)
      }
    end

    context 'creates sms' do
      specify {
        expect(messages).to respond_to(:create)
      }
    end

    context 'message' do
      specify {
        expect { subject.send("0", { time: "1" }) }.to output.to_stdout
      }
    end
  end
end
