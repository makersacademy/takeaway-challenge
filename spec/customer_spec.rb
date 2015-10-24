require 'customer'

describe Customer do

subject(:customer) { described_class.new(takeaway_klass) }
let(:takeaway_klass) { double(new: takeaway) }
let(:takeaway) { double(menu: {noodles: 6.95, rice: 2.95})}

describe '#initialize' do
  it 'lets a customer select a takeaway to order from' do
    expect(customer).to have_attributes(takeaway: takeaway)
  end
end

describe '#view_menu' do
  it 'expects to be able to view a menu' do
    expect(customer.view_menu).to eq(takeaway.menu)
  end
end

describe '#select_dish' do
  it 'notifies a customer if their order is not on the menu' do
    error = 'Dish unavailable: please select a dish from the menu'
    expect{customer.select_dish(:vanilla_ice_cream, 1)}.to raise_error error
  end

  it 'lets a customer select a dish with a specified quantity' do
    customer.select_dish(:noodles, 2)
    customer.select_dish(:rice, 1)
    expect(customer.selections).to eq(noodles: 2, rice: 1)
  end
end


end
