require 'texter'

describe Texter do
  subject { described_class.new }

  describe '#send' do
    it { is_expected.to respond_to(:send) }
  end
end
