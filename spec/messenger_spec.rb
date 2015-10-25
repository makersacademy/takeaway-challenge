require 'messenger'

describe Messenger do
  subject(:Restaurant) {described_class.new}

  it { is_expected.to respond_to(:create) }

end