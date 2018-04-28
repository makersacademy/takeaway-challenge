require 'order'

describe Order do

  let(:order) { Order.new }

  it { is_expected.to respond_to :see_menu }

end
