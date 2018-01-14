require 'rspec'
require 'menu_printer'

describe MenuPrinter do
  let (:dish_printer) { double :dish_printer, print: nil }
  let (:dish1) { double :dish1 }
  let (:dish2) { double :dish2 }
  let (:menu) { double :menu, dishes: [dish1, dish2], name: "test menu" }
  subject(:menu_printer) { described_class.new(dish_printer) }

  before(:each) { allow(menu).to receive(:is_a?).and_return true }

  it 'prints the menu name' do
    expect { menu_printer.print(menu) }.to output("Test Menu\n").to_stdout
  end

  it 'prints dishes' do
    allow(STDOUT).to receive(:puts)
    expect(dish_printer).to receive(:print).with(dish1).once
    expect(dish_printer).to receive(:print).with(dish2).once
    menu_printer.print(menu)
  end

  it 'fails to print something that is not a menu' do
    expect { menu_printer.print(1) }.to raise_error("Invalid menu")
  end
end