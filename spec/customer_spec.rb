require 'customer'
require 'menu'

describe Customer do
  let(:customer){Customer.new}
  let(:menu){ double :menu }


it 'should have a phone number on initialization' do
  expect(customer.mobile_no).to eq "+447939172106"
end



end

