require 'menu'

describe Menu do

it { is_expected.to respond_to(:load_menu) }
it { is_expected.to respond_to(:open) }

end
