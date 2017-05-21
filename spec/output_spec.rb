require 'output'

describe Output do
  subject(:output) { described_class.new }
  describe "#send_text" do
    it 'responds to the method' do
      expect(output).to respond_to(:send_text)
    end
  end
end
