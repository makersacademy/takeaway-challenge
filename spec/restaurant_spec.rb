require 'restaurant'

describe Restaurant do
  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:place_order) }

end
