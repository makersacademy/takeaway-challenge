require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it { is_expected.to respond_to(:options) }

end
