require 'total'
describe Total do
  menu = MainMenu.new
  subject(:total) { Order.new('pizza, curry, pizza', menu, Total.new) }
  it 'can calculate a total' do
    total.set_menu
    expect(total.confirm_total).to eq ("pizza = 5.0 curry = 2.2 pizza = 5.0 total = £12.2")
  end
end
