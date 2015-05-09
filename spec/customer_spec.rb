require 'customer'

describe Customer do
  let (:subject) {Customer.new{Takeaway.new}}

  it{is_expected.to respond_to(:check_menu)}
  it{is_expected.to respond_to(:select_item)}
  it{is_expected.to respond_to(:check_order)}
  it{is_expected.to respond_to(:check_order_total)}
  it{is_expected.to respond_to(:confirm_order)}
end