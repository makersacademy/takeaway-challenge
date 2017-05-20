
require_relative '../lib/printer'

describe Printer do
  subject(:printer) { Printer.new }
  let(:dish) { double(:dish, name: 'Pretzels', description: 'These pretzels are making me thirsty!', price: 2) }
  let(:menu) { double(:menu, dishes: [dish]) }
  let(:expected_menu_output) { "---\n1. Pretzels - £2\nThese pretzels are making me thirsty!\n---\n" }
  # let(:expected_order_output) {  }

  it 'when given a menu, it prints a formatted menu to the stdout' do
    expect { printer.send(:print_menu, menu) }.to output(expected_menu_output).to_stdout
    puts menu.class
  end

  # it 'when given an order, it prints a formatted order to the stdout' do
  #   expect { printer.send(:print_order, order) }.to output(expected_output).to_stdout
  #   puts menu.class
  # end
end
