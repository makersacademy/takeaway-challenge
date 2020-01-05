require 'menu_printer'

describe MenuPrinter do

  subject{MenuPrinter}

  describe '.print_menu' do
    it 'returns menu from given array in fancy print format' do
      headers = {name: "Description", price: 'Price'}
      items = [{name: 'ham_and_mushroom_pizza', price: 12.99},
        {name: 'fanta', price: 2.99},
        {name: 'white_wine', price: 7.99}]
      menu = {headers: headers, items: items}
      expect(subject.print_menu(menu)).to eq("+------------------------+-------+\n| Description            | Price |\n+------------------------+-------+\n| ham_and_mushroom_pizza | 12.99 |\n| fanta                  | 2.99  |\n| white_wine             | 7.99  |\n+------------------------+-------+\n")
    end
  end
end
