require 'printer'

describe Printer do

  before :each do
    @printer = Printer.new
  end

  let(:menu) { double(:menu, dishes: { 1 => { dish: :Pizza, price: 8.50 } }) }
  let(:currentorder) { double(:currentorder, ordered_dishes: [{ dish: :Pizza, price: 8.50 }]) }
  let(:currentorder2) { double(:currentorder2, ordered_dishes: [{ dish: :Pizza, price: 8.50 }, { dish: :Pasta, price: 9.20 }], ordertotal: 17.7) }

  it 'returns a Printer object' do
    expect(@printer).to be_an_instance_of Printer
  end

  it 'prints a string' do
    expect { @printer.printmenu }.to output.to_stdout
  end

  it 'prints the menu items in a consistent format' do
    expect { @printer.printmenu(menu) }.to output("1. Pizza - £8.5.\n").to_stdout
  end

  it 'prints the current order in a consistent format' do
    expect { @printer.printorder(currentorder) }.to output("-----YOUR ORDER-----\nPizza - £8.5.\n--------------------\n").to_stdout
  end

  it 'prints an order summary' do
    expect { @printer.printsummary(currentorder2) }.to output("The number of dishes ordered is 2. Your total is £17.7.").to_stdout
  end

end
