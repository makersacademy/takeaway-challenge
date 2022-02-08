require 'confirm_order'

describe ConfirmOrder do
  # instance variables:
  it { is_expected.to respond_to(:contact_number, :ordered_time, :ordered_list, :total) }
  # methods
  it { is_expected.to respond_to(:send_confirmation) }

  
end