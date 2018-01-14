require 'rspec'
require 'order_printer'

describe OrderPrinter do
  let(:dish_list_printer) { double :dish_list_printer, print: nil }
  let(:order) { double :order, total: 50, items: nil, time: Time.at(0), is_a?: true }
  subject(:order_printer) { described_class.new(dish_list_printer) }

  it 'prints dishes' do
    allow(STDOUT).to receive(:puts)
    expect(dish_list_printer).to receive(:print).exactly(1).times
    order_printer.print(order)
  end

  it 'prints order total and time' do
    expect { order_printer.print(order) }.to output("Total...£50.00\nOrder placed at...#{Time.at(0).strftime('%d-%m-%Y %H:%M:%S')}\n").to_stdout
  end

  it 'fails to print something that is not an order' do
    expect { order_printer.print(1) }.to raise_error("Invalid order")
  end
end