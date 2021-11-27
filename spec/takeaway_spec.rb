require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  describe '#menu' do

    it { is_expected.to respond_to(:read_menu) }
  
    
  end
end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
