require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  let(:menu) { double(:my_menu, show_menu: [dish]) }
  let(:dish) { double(:my_dish, tag: 1, name: 'name', description: 'description', price: 5) }

  it 'print the menu' do
    expect { printer.print_menu(menu.show_menu) }.to output("#1: name, description, £5.\n").to_stdout
  end
end
