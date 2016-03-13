require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order_class) }
  let(:order_class) { double :order_class, new: order_instance }
  let(:order_instance) { double :order_instance, order: nil }
  let(:menu) { double :menu }

  it {is_expected.to respond_to(:read_menu)}
  it {is_expected.to respond_to(:new_order)}
  it {is_expected.to respond_to(:add_to_order)}


end
