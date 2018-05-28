require 'confirmation'

describe Confirmation do

  subject(:confirmation) { described_class.new }

  describe "#send" do
    it "sends confirmation text message" do
      expect(STDOUT).to receive(:puts)
      confirmation.send
    end
  end

end
