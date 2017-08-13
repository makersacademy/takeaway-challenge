require 'sms'

describe SMS do
  describe '.send' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:send)
      }
    end

    context 'message' do
      specify {
        expect { subject.send("0", {time: "1"}) }.to output.to_stdout
      }
    end
  end
end
