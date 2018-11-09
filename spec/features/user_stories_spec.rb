require 'menu'

describe 'User stories: ' do
    let(:menu_data) { [{id: 1, name: 'Chicken Korma'  , description: 'Mild cream based curry', price: 599},
                 {id: 2, name: 'Vindaloo'  , description: 'Very hot curry', price: 699},
                 {id: 3, name: 'Tikka'  , description: 'Dry curry', price: 499}] }


  it 'can print a list of dishes with prices' do
    menu = Menu.new(menu_data)
    expected_output =  "1: Chicken Korma £5.99\n   Mild cream based curry\n2: Vindaloo £6.99\n   Very hot curry\n3: Tikka £4.99\n   Dry curry\n"
    expect{ menu.print }.to output(expected_output).to_stdout
  end

 # it 'allows customers to select a number of available dishes' do
 #   menu = Menu.new(menu_data)
 #   customer.new(name, phone_number, oder)

 #   customer.select_dishes(menu, [1, 2, 3])

 #   expect(customer.order.dishes).to eq(menu_data)
 # end
end
