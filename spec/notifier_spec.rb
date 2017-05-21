require 'notifier'

describe Notifier do

  subject(:notifier) { described_class.new }

  it { is_expected.to respond_to(:send_message).with(1).argument }

end
