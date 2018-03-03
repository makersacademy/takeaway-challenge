require 'printer'

describe Printer do

  describe '#formatter' do

    it 'Should puts the document' do
      document = "hello"
      expect(subject.formatter(document)).to eq "hello"
    end
  end
end
