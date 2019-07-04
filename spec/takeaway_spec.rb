# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'takeaway'

describe TakeAway do
  let(:menu) {double :menu}
  describe '#view_dishes' do
    it 'lets customer see a list of dishes with prices' do
      expect(subject.view_dishes(menu)).to eq menu
    end
  end
end
