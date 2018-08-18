require 'menu'

describe Menu do

  let(:printer_module) { double :double }
  let(:order_checker)  { double :double }
  subject { described_class.new(printer_module, order_checker) }

  describe '#print_menu' do
    it 'passes #to_string to MenuPrinter' do
      expect(printer_module).to receive(:to_string)
      subject.print_menu
    end
  end

  describe '#check_order' do
    it 'passes #check_order to OrderChecker' do
      order_array = [[3,1], [8,1], [3,5]]
      expect(order_checker).to receive(:check_order)
      subject.check_order(order_array)
    end
  end

end
