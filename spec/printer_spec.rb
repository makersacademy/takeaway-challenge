require 'printer'

describe Printer do

  describe '#formatter' do

    it 'Should respond to  the document and puts' do
      document = [ {i: "", p: ""} ]
      expect(subject.formatter(document)).to eq(nil)
    end
  end
end
