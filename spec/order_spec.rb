require 'order'

describe Order do

it {is_expected.to respond_to(:sum).with(1).argument}

end