require 'customer'

describe Customer do
  customer = Customer.new
  it{is_expected.to respond_to(:check_menu)}
  it{is_expected.to respond_to(:select_item)}
end