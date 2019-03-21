require 'messager_stdout'

describe MessagerStdout do
  subject(:confirmation_sender) { described_class.new }
  let(:message) { double :message }

  describe "#send" do
    it 'outputs a message to STDOUT' do
      expect { confirmation_sender.send(message) }.to output(message.to_s + "\n").to_stdout
    end
  end
end
