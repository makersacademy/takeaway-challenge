require 'csv'
require 'menu'

describe Menu do

  describe '#initialize' do
    it { is_expected.to respond_to :menu }
    it { is_expected.to respond_to :load_file }
    it { is_expected.to respond_to :col_width }
    it { is_expected.to respond_to :print_menu }
  end

end
