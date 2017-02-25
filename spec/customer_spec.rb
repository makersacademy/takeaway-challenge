require 'customer'

describe Customer do
  subject(:customer) { described_class.new }

  it 'displays a menu to customer' do
    expect(customer).to respond_to(:display_menu).with(1).argument
  end
end
