require 'printer'

describe Printer do
  describe '#display' do
    context 'when called by Menu' do
      it 'displays name and price of each dish' do
        response = "\u2022 Fish and Chips      £12.95\n"
        expect { subject.display("Fish and Chips",1295) }.to output.to_stdout
      end
    end
  end
end
