require 'restaurant'

describe Restaurant do
  let(:restaurant){described_class.new}
  let(:menu){double :menu}

it 'should return a list of the menu items' do
  menu = Menu.new
  expect(restaurant.list(menu)).to eq (menu.items)
end

it 'can hold a list of dishes' do
  expect(restaurant.select("boquerones")).to eq ["boquerones"]
end

it 'returns the number of items you ordered' do
  restaurant.select("boquerones")
  restaurant.select("shishito peppers")
  restaurant.select("tortilla espanola")
  expect(restaurant.total_dishes).to eq 3
end

it 'returns quantity of dishes you ordered' do
  restaurant.select("shishito peppers")
  restaurant.select("shishito peppers")
end

it 'returns your order total' do
  menu = Menu.new
  restaurant.select("boquerones")
  expect(restaurant.bill_total).to eq 5
end

it 'will not let you order something not on the menu' do
  expect{restaurant.select("taco")}.to raise_error "That item isn't on the menu"
end

it 'won\'t let you place an empty order' do
  expect{restaurant.order}.to raise_error "You submitted an empty order"
end


it 'returns a message that denotes order will be delivered in an hour' do
  restaurant.select("shishito peppers")
  t = Time.new + 60*60
  hour_and_minute = t.hour.to_s + ":" + t.min.to_s
  m = "Thank you! Your order was placed and will be delivered before "
  expect(restaurant.order).to eq (m + hour_and_minute)
end

end
