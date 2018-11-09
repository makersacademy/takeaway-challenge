require 'menu'
require_relative './test_data'

describe Menu do
  let(:menu_data) { TestData::menu_data }
  let(:expected_menu_print_output) { TestData::expected_menu_print_output }
  let(:menu_data_pence) { TestData::menu_data_pence  }
  let(:expected_menu_print_output_pence) { TestData::expected_menu_print_output_pence }

  subject(:menu) { Menu.new(menu_data) }

  it 'can print a list of dishes with prices' do
    expect{ menu.print }.to output(expected_menu_print_output).to_stdout
  end

  it 'will print prices in pence correctly i.e. £00.65' do
    menu_pence = Menu.new(menu_data_pence)
    expect{ menu_pence.print }.to output(expected_menu_print_output_pence).to_stdout
  end
end
