require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#read_menu' do
    it { is_expected.to respond_to(:show_menu) }
  end



end
