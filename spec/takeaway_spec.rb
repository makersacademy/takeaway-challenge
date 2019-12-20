require 'Takeaway'
describe Takeaway do
  describe '#see' do
  it {is_expected.to respond_to(:see).with(1).argument }
  end
end
