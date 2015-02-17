require 'order'

describe Order do

  let (:order) { Order.new('Phil Brockwell', '+447737932693') } 

  it 'is initialised with a customer name and number' do
    expect(order.customer_name).to eq('Phil Brockwell')
  end

  it 'stores a customers phone number' do
    expect(order).to respond_to(:customer_number)
  end

  it 'is initialised with an empty items hash' do
    expect(order.items).to eq({})
  end

  it 'can add a phone number' do
    order.get_number('+447737932693')
    expect(order.customer_number).to eq('+447737932693')
  end

  it 'can add a dish to the items hash' do
    order.add_item('Tea', 1)
    expect(order.items).to include('Tea' => 1)
  end

end