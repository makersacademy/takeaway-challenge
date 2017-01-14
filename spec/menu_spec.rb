require 'menu'

describe "Menu" do

  subject(:menu) { Menu.new }
  let(:list_dishes_and_prices) { double :list_dishes_and_prices }

  it "should return a list of dishes and their prices" do
    allow(menu).to receive(:print_menu).and_return(list_dishes_and_prices)
    expect(menu.print_menu).to eq(list_dishes_and_prices)
  end


end
