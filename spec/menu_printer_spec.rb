require 'menu_printer'

describe MenuPrinter do
  describe '#print' do

    let(:dish_printer_module) { double(:dish_printer_module) }
    let(:menu) { { :dish1 => double(:yummy), :dish2 => double(:scrummy) } }

    it "sends each dish to the dish_printer" do
      expect(dish_printer_module)
        .to receive(:print).with(menu[:dish1])
      expect(dish_printer_module)
        .to receive(:print).with(menu[:dish2])

      described_class.print(menu, dish_printer_module)

    end
  end
end
