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
      order_array = [[[1,1], [3,1], [7,1]], 12]
      expect(order_checker).to receive(:check_order).and_return(12)
      subject.check_order(order_array)
    end
  end

end
