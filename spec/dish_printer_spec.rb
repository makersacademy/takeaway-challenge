require 'rspec'
require 'dish_printer'

describe DishPrinter do
  subject(:dish_printer) { described_class.new }
  let(:dish) { double :dish, name: "Pancakes", price: 3.00 }

  it 'prints a dish' do
    allow(dish).to receive(:is_a?).and_return true
    expect { dish_printer.print(dish) }.to output("Pancakes...£3.00\n").to_stdout
  end

  it 'fails to print something that is not a dish' do
    expect { dish_printer.print(1) }.to raise_error("Invalid dish")
  end
end
