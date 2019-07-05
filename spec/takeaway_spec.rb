# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'takeaway'

describe TakeAway do
  let(:menu) {double :menu}
  describe '#view_dishes' do
    xit 'lets customer see a list of dishes with prices' do
      expect(subject.view_dishes).to be_truthy
    end
  end
  describe '#order' do
    xit "a customer can create an order" do
      takeaway = TakeAway.new
      takeaway.order
      expect(takeaway::@current_order).to not_eq nil
    end
  end
end
