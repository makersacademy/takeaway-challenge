require 'customer'
describe Customer do

  describe '#ordering' do
    it { is_expected.to respond_to(:check_menu) }
    it { is_expected.to respond_to(:select_item) }
    it { is_expected.to respond_to(:selection) }
  end
    
end  