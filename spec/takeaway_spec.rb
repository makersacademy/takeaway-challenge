require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to :check_menu }

  it { is_expected.to respond_to(:add_to_order).with(2).arguments }

  it 'should be initialised with a default menu' do
    expect(subject.menu).to eq Takeaway::MENU
  end

  describe 'check' do

    it 'should print out the list of dishes and prices' do
      expect(subject.check_menu).to eq Takeaway::MENU
    end

  end

  describe 'add_to_order' do

    it 'should raise an error message if the dish does not match an item in the menu' do
      expect { subject.add_to_order(1, :pizza) }.to raise_error "Sorry! That's not on the menu!"
    end

    it 'should add the price of the ordered dish to a running total of costs' do
      subject.add_to_order(1, :prawn_toast)
      subject.add_to_order(2, :spring_rolls)
      expect(subject.total_cost).to eq 6.50
    end

    it 'should add the ordered item and total price for the item(s) to the order summary' do
      subject.add_to_order(2, :prawn_toast)
      expect(subject.order_summary).to include :prawn_toast => 5.0
    end
  end

  describe 'check_order_summary' do
    # Really struggled with this test! I wanted to check that the method printed everything out correctly - it does in irb but can't think of a way to test it here..
    xit 'should print your order summary and the total cost of your order' do
    end
  end

  describe 'pay' do

    before(:each)do
      subject.add_to_order(3, :spring_rolls)
    end

    it 'should raise an error message if you try to pay the wrong amount' do
      expect { subject.pay 4 }.to raise_error "Sorry, you need to pay the exact total - £6.00"
    end

    it 'should confirm your payment has been accepted once you pay the correct amount' do
      expect(subject.pay 6).to eq "Thanks for your order - delivery time will be confirmed by text message"
    end

    it 'should clear your order summary once you pay the correct amount' do
      subject.pay 6
      expect(subject.order_summary).to be_empty
    end

    it 'should return total_cost to 0 once you pay the correct amount' do
      subject.pay 6
      expect(subject.total_cost).to eq 0
    end
  end

end
