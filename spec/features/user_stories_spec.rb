require 'menu'

describe 'User stories: ' do
  it 'can print a list of dishes with prices' do
    menu_data = [{id: 1, name: 'Chicken Korma'  , description: 'Mild cream based curry', price: 599},
                 {id: 2, name: 'Vindaloo'  , description: 'Very hot curry', price: 699},
                 {id: 3, name: 'Tikka'  , description: 'Dry curry', price: 499}]
    menu = Menu.new(menu_data)
    expected_output =  "1: Chicken Korma £5.99\n   Mild cream based curry\n2: Vindaloo £6.99\n   Very hot curry\n3: Tikka £4.99\n   Dry curry\n"

    expect{ menu.print }.to output(expected_output).to_stdout
  end
end
