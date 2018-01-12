require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double(:dish1) }
  let(:printer) { double(:my_printer, print_menu: 'dish') }

  it 'gives access to a list of dishes' do
    expect(menu.show_menu.is_a? Array).to be true
  end

  it 'dishes can be added to the list' do
    menu.add_dish(dish)
    expect(menu.show_menu.include? dish).to be true
  end

  it 'can use print on a printer object' do
    expect(menu.print_menu(printer)).to eq 'dish'
  end
end
