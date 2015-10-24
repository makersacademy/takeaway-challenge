require 'customer'

describe Customer do

subject(:customer) { described_class.new(takeaway_klass) }
let(:takeaway_klass) { double(new: takeaway) }
let(:takeaway) { double(menu: :food) }

describe '#initialize' do
  it 'lets a customer select a takeaway to order from' do
    expect(customer).to have_attributes(takeaway: takeaway)
  end
end

it 'expects to be able to view a menu' do
  expect(customer.view_menu).to eq(takeaway.menu)
end




end
