require 'textbot'

describe Textbot do
  subject(:textbot) { described_class.new }
  let(:clientdouble) { double(:clientdouble, messages: messagedouble) }
  let(:messagedouble) { double(:messagedouble, create: nil, sid: nil) }

  describe "#initialize" do

  end

  describe "#sendmessage" do
    it "responds to #sendmessage" do
      expect(textbot).to respond_to(:sendmessage).with(1)
    end

    it "accepts  dummy client" do
      expect(clientdouble).to receive(:messages)
      textbot.sendmessage(0, clientdouble)
    end
  end
end
