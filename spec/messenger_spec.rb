require 'messenger'

describe Messenger do

    it { is_expected.to respond_to(:send).with(1).argument }

end
