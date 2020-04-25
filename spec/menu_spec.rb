require 'menu'

context Menu do

  it { is_expected.to respond_to(:add).with(1).argument }

end
