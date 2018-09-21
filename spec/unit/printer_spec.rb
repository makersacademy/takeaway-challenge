require 'printer'

describe Printer do
  describe '#format_price' do
    subject(:printer) { described_class.new }
    it 'returns price in xx.xx format' do
      expect(printer.format_price(3)).to eq '3.00'
    end
  end
end
