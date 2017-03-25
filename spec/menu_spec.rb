require 'menu'

describe Menu do

it { is_expected.to respond_to(:open) }
it { is_expected.to respond_to(:add_item).with(1).argument }

end
