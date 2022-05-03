require 'menu'
describe Menu do
  describe '#view' do
    it 'prints the items in the menu' do
      expect { subject.view }.to output(["Rasam, £5", "Plain Dosa, £6", "Masala Dosa, £7", "Rasavangi, £7.5", "Plain Rice, £3", "Tamarind Rice, £3.5", "Mango Halwa, £4"].join("\n")).to_stdout
    end
  end
end