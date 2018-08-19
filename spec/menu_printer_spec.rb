require 'menu_printer'

describe MenuPrinter do

  it 'Is expected to return a pretty printed menu' do
    menu = [
      { dish: "Dish1", price: 2.5 },
      { dish: "Dish2", price: 3.5 },
      { dish: "Dish3", price: 4.0 },
      { dish: "Dish4", price: 3.0 }
    ]

    expect(subject.to_string(menu)).to eq(
      "1. Dish1, £2.5\n"\
      "2. Dish2, £3.5\n"\
      "3. Dish3, £4.0\n"\
      "4. Dish4, £3.0"
    )
  end

end
