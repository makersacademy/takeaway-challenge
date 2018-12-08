require 'restaurant'
require 'menu'

describe Restaurant do 

let(:restaurant) {Restaurant.new}
let(:menu) {double :menu}
let(:current_menu) {double :current_menu}
let(:item) {double :item}
let(:order_obj) {double :order_obj}
menu_hash = {
  "Margherita" => 5.50,
  "Quattro stagioni" => 7,
  "Pepperoni" => 8,
  "Pollo ad astra" => 6.50,
  "Green salad" => 4.50,
  "Dough balls" => 3.50,
  "Peroni" => 4.50,
  "Coca cola" => 3.00,
  "House white (bottle)" => 14,
  "House red (bottle)" => 14.20,
  "Sticky toffee pudding" => 4.20
}

it 'responds to #show_menu' do
  expect(restaurant).to respond_to(:show_menu)
end 

it '#show_menu displays menu_hash' do
  expect(restaurant.show_menu).to eq(menu_hash)
end

it 'responds to #order' do
   expect(restaurant).to respond_to(:order)
end

it '#order receives user input' do
  restaurant.stub(:gets) {"Beer\n"}
  expect(restaurant.order).to eq(["Beer"])
end

end