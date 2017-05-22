require 'messager'

describe Messager do
  it { is_expected.to respond_to(:send_confirmation).with(1).argument }

end
