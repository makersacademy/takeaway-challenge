require 'messager_stdout'

describe MessagerStdout do
  subject(:confirmation_sender) { described_class.new }
  describe "#send" do
    it 'outputs a message to STDOUT' do
      message = "some string"
      expect { confirmation_sender.send(message) }.to output(message + "\n").to_stdout
    end
  end
end
