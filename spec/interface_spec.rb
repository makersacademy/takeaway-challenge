#require './lib/interface.rb'

# Unit tests for Interface
describe Interface do
  context "#print_menu" do
    let(:input) {"1\n"}

    before do
      allow(Kernel).to receive(:puts)
      allow(STDIN).to receive(:gets).and_return(input)
    end

    it 'outputs menu options' do
      print_options

      expect(Kernel).to have_received(:puts).with("\n1. Show Menu").once
    end

    it 'asks for input' do
      print_options

      expect(STDIN).to have_received(:gets).once
    end

    it 'returns the sanitized input' do
      expect(print_options).to eq '1'
    end
  end

end
