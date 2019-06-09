require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  it 'prints a list of dishes with prices' do 
    printed_menu = "Jollof rice: £6.00, Fried plantain: £3.00, Jerk chicken: £8.00, Vegetable patty: £4.50, Ice cream: £4.00"
    expect(menu.print_menu).to eq(printed_menu)
  end  
end
