require 'menu'
describe Menu do

  subject(:menu)  { described_class.new(dishes) }
  let(:dishes)    {   
    { 
      "chicken curry": 7.99, 
      "vegetable curry": 5.99
    }
  }

  it 'has a menu of dishes and prices' do 
    expect(menu.dishes).to eq dishes
  end

  it 'can print out the dishes' do
    printed_menu = "Chicken curry £7.99, Vegetable curry £5.99"

    expect(menu.print_menu).to eq printed_menu
  end

end
