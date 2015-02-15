require 'customer'
require 'menu'

describe Customer do
  let(:customer){Customer.new}
  let(:menu){ double :menu }


it 'should have a phone number on initialization' do
  expect(customer.mobile_no).to eq "+447939172106"
end

it 'can select items' do
  expect(customer.select_items(menu)).to eq customer.order
end

it 'change the quantity of items' do
  expect(customer.set_quantity).to change select_items.by 1
end


end

