require './lib/texting.rb'

describe Texting do

  context '#send_text' do
    subject(:texting_class)           { described_class.new }

    it "Should send text message to client" do
      expect(texting_class).to receive(:send_text)
      texting_class.send_text
    end
  end
end
