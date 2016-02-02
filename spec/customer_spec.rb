require 'customer'

describe Customer do
  subject(:custoemr) { Customer.new('Test', '07712987654') }

  it { is_expected.to have_attributes(name: 'Test', phone: '07712987654') }
end
