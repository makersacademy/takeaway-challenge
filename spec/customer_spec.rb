require_relative '../lib/customer'

describe Customer do

  it 'Checks that a customer can list all dishes on the menu' do
    expect(subject).to respond_to(:list_menu)
  end

  it 'Checks that a customer can submit an order' do
    expect(subject).to respond_to(:order)
  end
end