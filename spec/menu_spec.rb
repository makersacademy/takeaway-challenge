<<<<<<< HEAD
require 'Menu'

describe Menu do
  # defining list_of_dishes as an array of hashes
  let(:list_of_dishes) do
    [
         { dish: 'Fries', price: 1.99 },
         { dish: 'Cheeseburger', price: 2.99 },
         { dish: 'Coke', price: 0.99 },
         { dish: 'Salad', price: 1.99 },
         { dish: 'Ice Cream', price: 0.99 }
     ]
  end

  subject { Menu.new } # set the subject new menu
  it { is_expected.to respond_to(:list_of_dishes) } # the subject is expected to respond to the list of dishes

  describe '#print_menu' do # prints the menu
    it 'returns the list of dishes with prices' do
      expect(subject.print_menu).to eq(list_of_dishes)
    end
  end
end

=======
require "Menu"
# US1
describe Menu do

  subject(:menu) { Menu.new(list_of_dishes) } #inject the hash to the menu (needs to be initialized!)
  #create a list of dishes hash
  let(:list_of_dishes) do {
      Coffee: 0.99,
      Sandwich: 3.99,
      Water: 1.19,
      Salad: 4.99
  }
  end
  it "contains list of dishes with prices" do # to be able to print the list, first we create the list
    expect(menu.list_of_dishes).to eq(list_of_dishes)
  end

  it "prints list_of_dishes with prices" do # after create lis, print
    printed_menu = "Coffee £0.99, Sandwich £3.99, Water £1.19, Salad £4.99"
    expect(menu.print).to eq (printed_menu)
  end
  # US1
  it "says if a dish is available in the list of dishes" do
    expect(menu.dish_available?(:Coffee)).to be true
  end

  it "says if a dish is NOT available in the list of dishes" do
    expect(menu.dish_available?(:Sundaes)).to be false
  end

  it 'fetches a price from the list of dishes' do
    expect(menu.price(:Coffee)).to eq(list_of_dishes[:Coffee])
  end
end
>>>>>>> 07d35f2487bb93c4fdfb629eb5cdc306fe8ed9d0
