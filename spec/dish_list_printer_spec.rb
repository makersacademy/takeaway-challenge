require 'rspec'
require 'dish_list_printer'

describe DishListPrinter do
  let(:dish_printer) { double :dish_printer, print: nil }
  let(:dish1) { double :dish1 }
  subject(:dish_list_printer) { described_class.new(dish_printer) }

  it 'prints a list of dishes' do
    expect(dish_printer).to receive(:print).exactly(4).times
    dish_list_printer.print([1, 2, 3, 4])
  end
end
