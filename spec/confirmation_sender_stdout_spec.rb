require 'confirmation_sender_stdout'

describe ConfirmationSenderStdout do
  subject(:confirmation_sender_stdout) { described_class }
  describe "#send" do
    it 'outputs a message to STDOUT' do
      message = "some string"
      expect { confirmation_sender_stdout.send(message) }.to output(message + "\n").to_stdout
    end
  end
end