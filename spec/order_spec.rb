require 'order'
require 'menu'

describe Order do

subject(:order) {Order.new}

it {is_expected.to respond_to :menu }
it {is_expected.to respond_to :order_summary}
it {is_expected.to respond_to(:add_order).with(2).argument}

end
