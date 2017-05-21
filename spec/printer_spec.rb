require 'printer'

describe Printer do
  let(:printer) {described_class.new}
  it { is_expected.to respond_to(:interactive_menu) }

  describe '#interactive_menu' do
    it 'prints menu to STDOUT ' do
      expect{printer.interactive_menu}.to output('1. See Menu').to_stdout
    end
  end
end
