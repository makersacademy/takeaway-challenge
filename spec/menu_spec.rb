require 'menu'

describe Menu do
  let(:mockprinter) { double(:mockprinter)}
  subject { described_class.new(mockprinter) }
  describe 'instantiation' do
    it '@list is set to LIST' do
      expect(subject.list).to eq(Menu::LIST)
    end
  end

  describe '#display' do
    before { allow(mockprinter).to receive(:display) }
    it 'calls printer.display' do
      expect(subject.printer).to receive(:display)
      subject.display
    end
  end
end
