require 'menu_printer'

describe MenuPrinter do
  describe '#print' do

    let(:dish_printer_module) { double(:dish_printer_module) }
    let(:menu) { [double(:yummy), double(:scrummy)] }

    it "sends each dish to the dish_printer" do
      expect(dish_printer_module)
        .to receive(:print).with(menu[0])
      expect(dish_printer_module)
        .to receive(:print).with(menu[1])

        described_class.print(menu, dish_printer_module)

    end
  end
end