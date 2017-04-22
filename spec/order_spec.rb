require 'order'

describe Order do

it { is_expected.to respond_to(:description) }

it { is_expected.to respond_to(:price) } 

end
