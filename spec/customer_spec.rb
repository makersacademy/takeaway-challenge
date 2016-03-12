require 'customer'

describe Customer do
  subject(:customer) { Customer.new('Test', '07712987654') }

  it { is_expected.to have_attributes(name: 'Test', phone: '07712987654') }
end
