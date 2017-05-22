require 'printer'

describe Printer do
  let(:printer) {described_class.new('Restaurant')}
  it { expect(printer).to respond_to(:interactive_menu) }

  describe '#interactive_menu' do
    it 'prints menu to STDOUT ' do
      expect{ printer.interactive_menu }.to output("1. See Menu\n2. Choose Item\n3. Checkout\n4. Confirm\n9. Exit\n").to_stdout
    end
  end

  describe '#input_item_selection' do
    it 'prints a request for selection' do
      expect{ printer.input_item_selection }.to output("Please input the item number of your selection\n").to_stdout
    end
  end

  describe '#input_quatity' do
    it 'prints a request for quantity' do
      expect{ printer.input_quantity }.to output("Please enter the quantity\n").to_stdout
    end
  end

end
