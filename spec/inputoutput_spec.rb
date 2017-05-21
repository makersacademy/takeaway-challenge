require 'inputoutput'

describe InputOutput do
  subject(:inputoutput) { described_class.new }
  describe "#send_text" do
    it 'responds to the method' do
      expect(inputoutput).to respond_to(:send_text)
    end
  end
end
