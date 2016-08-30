require 'printer'

describe Printer do

  subject(:printer){ described_class.new }
  let(:menu) {double :menu}
  let(:printed_menu) { "Rice: £1.50" }

  describe "#print" do

    it "should respond to print" do
      expect(printer).to respond_to(:print).with(1).argument
    end

    it "prints the menu" do
      allow(menu).to receive(:each){ printed_menu }
      expect(printer.print(menu)).to eq(printed_menu)
    end

  end
end
