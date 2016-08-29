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

it 'returns a message that denotes order will be delivered in an hour' do
  t = Time.new + 60*60
  message = "Thank you! Your order was placed and will be delivered before "
  expect(restaurant.order).to eq (message + (t.hour).to_s + ":" + t.min.to_s)
end

end
