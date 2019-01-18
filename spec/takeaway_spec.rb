require 'takeaway'

describe Takeaway do

it {is_expected.to respond_to(:make_order).with(1).argument}

end
