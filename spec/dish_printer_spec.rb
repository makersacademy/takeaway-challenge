require 'dish_printer'

describe DishPrinter do

  subject(:dish_printer) { described_class.new }
  let(:dbl_dish) { double :dish, print: 'Samosa, £1.0' }

  it 'prints a list of dishes correctly' do
    dish_list = [dbl_dish, dbl_dish, dbl_dish]
    expect(dish_printer.print(dish_list)).to eq "1. Samosa, £1.0\n" + \
    "2. Samosa, £1.0\n" + \
    "3. Samosa, £1.0\n"
  end
end
