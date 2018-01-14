require 'rspec'
require 'menu_printer'

describe MenuPrinter do
  let(:dish_list_printer) { double :dish_list_printer, print: nil }
  let(:dish1) { double :dish1 }
  let(:dish2) { double :dish2 }
  let(:menu) { double :menu, dishes: [dish1, dish2], name: "test menu" }
  subject(:menu_printer) { described_class.new(dish_list_printer) }

  before(:each) do
    allow(menu).to receive(:is_a?).and_return true
    allow(STDOUT).to receive(:puts)
  end

  it 'prints the menu name' do
    expect { menu_printer.print(menu) }.to output("Test Menu\n").to_stdout
  end

  it 'prints dishes' do
    expect(dish_list_printer).to receive(:print).exactly(1).times
    menu_printer.print(menu)
  end

  it 'fails to print something that is not a menu' do
    expect { menu_printer.print(1) }.to raise_error("Invalid menu")
  end
end
