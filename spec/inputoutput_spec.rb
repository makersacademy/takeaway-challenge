require 'inputoutput'

describe InputOutput do
  subject(:inputoutput) { described_class.new }
  describe "#print_to_terminal" do
      specify { expect { inputoutput.print_to_terminal('hello') }.to output('hello').to_stdout }
  end
  describe "#get_from_terminal" do
    it 'gets a value from the terminal' do
      allow(inputoutput).to receive(:gets) { "user input" }
      expect(inputoutput.get_input).to eq "user input"
    end
  end
  describe "#send_text" do
    it 'responds to the method' do
      expect(inputoutput).to respond_to(:send_text)
    end
  end
end
