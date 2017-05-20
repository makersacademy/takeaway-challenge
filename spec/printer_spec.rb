
require_relative '../lib/printer'

describe Printer do
  subject(:printer) { Printer.new }
  let(:dish) { double(:dish, name: 'Pretzels', description: 'These pretzels are making me thirsty!', price: 2) }
  let(:menu) { double(:menu, dishes: [dish]) }
  let(:expected_output) { "---\n1. Pretzels - £2\nThese pretzels are making me thirsty!\n---\n" }

  it 'prints a formatted menu to the stdout' do
    expect { printer.print_menu(menu)}.to output(expected_output).to_stdout
  end
end
