require 'menu'

describe Menu do
  let(:menu_data) { [ { id: 1, name: 'Chicken Korma', description: 'Mild cream based curry', price: 599 },
                           { id: 2, name: 'Vindaloo', description: 'Very hot curry', price: 699 },
                           { id: 3, name: 'Tikka', description: 'Dry curry', price: 499 } ] }
  let(:expected_menu_print_output) { "1: Chicken Korma £5.99\n   Mild cream based curry\n2: Vindaloo £6.99\n   Very hot curry\n3: Tikka £4.99\n   Dry curry\n" }
  let(:menu_data_pence) { [ { id: 1, name: 'Chicken Korma', description: 'Mild cream based curry', price: 69 },
                           { id: 2, name: 'Vindaloo', description: 'Very hot curry', price: 79 },
                           { id: 3, name: 'Tikka', description: 'Dry curry', price: 99 } ] }
  let(:expected_menu_print_output_pence) { "1: Chicken Korma £00.69\n   Mild cream based curry\n2: Vindaloo £00.79\n   Very hot curry\n3: Tikka £00.99\n   Dry curry\n" }
  subject(:menu) { Menu.new(menu_data) }
  it 'can print a list of dishes with prices' do
    expect{ menu.print }.to output(expected_menu_print_output).to_stdout
  end

  it 'will print prices in pence correctly i.e. £00.65' do
    menu_pence = Menu.new(menu_data_pence)
    expect{ menu_pence.print }.to output(expected_menu_print_output_pence).to_stdout
  end
end
