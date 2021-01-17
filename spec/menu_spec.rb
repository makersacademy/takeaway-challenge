require 'csv'
require 'menu'

describe Menu do

  describe '#initialize' do
    it { is_expected.to respond_to :menu }
    it { is_expected.to respond_to :load_menu }
    it { is_expected.to respond_to :print_menu }
  end

end
