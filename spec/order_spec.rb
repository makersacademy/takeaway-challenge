require 'order'

describe Order do
  it {is_expected.to respond_to :meal_order}

  it {is_expected.to respond_to :order_total}
end