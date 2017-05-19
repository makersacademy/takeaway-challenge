require 'restaurant'

describe Restaurant do

  it { is_expected.to respond_to(:menu) } # .with(1).argument 

end
