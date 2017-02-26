require 'dishes'

describe Dishes do
  subject(:dishes) { described_class.new(menu_item) }
  let (:menu_item) do
    { Pizza: 7.99,
      Pasta: 5.50 }
  end
  let(:example_dish) {:example_dish}

  it 'has dishes with prices' do
    expect(dishes.dishes).to eq menu_item
  end

  it 'prints the list of dishes with prices' do
    printed_menu = "Pizza: £7.99", "Pasta: £5.50"
    expect(dishes.print_dishes).to eq printed_menu
  end

end
