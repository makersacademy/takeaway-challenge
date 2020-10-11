require 'printer'

describe Printer do
  let(:menu)  { double :menu, display_menu: 'carbonara' }
  let(:order)  { double :order }
  subject(:printer)  { Printer.new(order, menu) }

  describe "#read_menu" do
    it 'prints out menu' do
      expect{ printer.print_menu }.to output("carbonara\n").to_stdout
    end
  end

  describe "order input" do
    it 'prints out order into' do
      expect{ printer.place_order }.to output("Please enter item name\n").to_stdout
    end

    it 'prints out quantity into' do
      expect{ printer.input_quantity }.to output("How many would you like?\n").to_stdout
    end
  end
end
