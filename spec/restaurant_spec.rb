require 'restaurant'

describe Restaurant do
  
  subject(:cafe) { described_class.new(menu, order) }
  let(:menu)           { double :menu, new: menu_instance}
  let(:menu_instance)  { double :menu_instance}
  let(:order)          { double :order, new: order_instance }
  let(:order_instance) { double :order_instance}
  
  it 'shows the restaurant menus' do
    expect(menu_instance).to receive(:print_menus).and_return("starter_menu_main_menu")
    expect(cafe.show_menu).to eq("starter_menu_main_menu")
  end
end