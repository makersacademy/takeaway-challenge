require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#read_menu' do
    it 'reads the file' do
      allow(CSV).to receive(:read).with('dishes.csv') {[['Parmigiana di meanzane', '7.95']]}
      expect(CSV).to receive(:read).with('dishes.csv')
      menu.read_menu('dishes.csv')
    end
  end

  describe '#print_menu' do
    it 'prints a list of dishes and their prices' do
      expect(subject).to receive(:print_menu)
      subject.print_menu
    end
  end
end
