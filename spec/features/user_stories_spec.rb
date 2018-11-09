require 'menu'
require_relative '../test_data'

describe 'User stories: ' do
  let(:menu_data) { TestData::menu_data }

  it 'can print a list of dishes with prices' do
    menu = Menu.new(menu_data)
    expected_output = TestData::expected_menu_print_output
    expect{ menu.print }.to output(expected_output).to_stdout
  end

  it 'allows customers to select a number of available dishes' do
    menu = Menu.new(menu_data)
    customer.new(name, phone_number, oder)

    customer.select_dishes([1, 2, 3])

    expect(customer.order.dishes).to eq(menu_data)
  end
end
