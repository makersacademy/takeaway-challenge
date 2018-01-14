require 'rspec'
require 'shopping_cart_printer'

describe ShoppingCartPrinter do
  let(:dish_list_printer) { double :dish_list_printer, print: nil }
  let(:shopping_cart) { double :shopping_cart, total: 50, items: nil, is_a?: true }
  subject(:shopping_cart_printer) { described_class.new(dish_list_printer) }

  it 'prints dishes' do
    allow(STDOUT).to receive(:puts)
    expect(dish_list_printer).to receive(:print).exactly(1).times
    shopping_cart_printer.print(shopping_cart)
  end

  it 'prints shopping cart total' do
    expect { shopping_cart_printer.print(shopping_cart) }.to output("Total...£50.00\n").to_stdout
  end

  it 'fails to print something that is not a shopping cart' do
    expect { shopping_cart_printer.print(1) }.to raise_error("Invalid shopping cart")
  end
end