require 'order_manager'

describe OrderManager do

  let(:printer_module) { double :double }
  let(:checker)        { double :double }
  let(:order_checker)  { double :double, new: checker }
  subject { described_class.new(printer_module, order_checker) }

  describe '#see_menu' do
    it 'passes #to_string to MenuPrinter' do
      expect(printer_module).to receive(:to_string)
      subject.see_menu
    end
  end

  describe '#place_order' do
    it 'passes #check_order to OrderChecker' do
      order_array = [[[1, 1], [3, 1], [7, 1]], 12]
      expect(checker).to receive(:check_order).and_return(12)
      subject.place_order(order_array)
    end
  end

end
