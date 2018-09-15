require 'menu'

describe Menu do
  
  describe '#list' do
    it { is_expected.to respond_to(:list) }
  end

end