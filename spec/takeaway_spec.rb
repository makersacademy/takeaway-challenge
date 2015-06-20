require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to :menu }
  
  it { is_expected.to respond_to :show_menu }

  describe 'show_menu' do
    xit 'displays a list of dishes and prices' do
      expect(subject.show_menu).to eq ( )
    end
  end

  it { is_expected.to respond_to(:order).with(2).arguments }
  
  it { is_expected.to respond_to(:order_list) }

  it { is_expected.to respond_to(:check_price).with(1).argument }

  it { is_expected.to respond_to(:order_total) }

  it { is_expected.to respond_to (:order_confirm) }


  describe 'order_list' do 
    it 'keeps track of the items ordered and number of each' do
      subject.order('tempura', 1)
      subject.order('gyoza', 1)
      subject.order('tempura', 1)
      expect(subject.order_list).to eq ['tempura', 'gyoza', 'tempura']
    end
  end

  describe 'order_total' do
    it 'calculates the total price of items ordered' do
      subject.order('tempura', 1)
      subject.order('gyoza', 1)
      subject.order('tempura', 1)
      expect(subject.order_total).to eq 19
    end
  end

  describe 'check_price' do
    it 'compares the expected price with the order price' do
      subject.order('tempura', 1)
      subject.order('gyoza', 1)
      subject.order('tempura', 1)
      expect(subject.check_price(19)).to eq(true)
    end

    # it 'stops the order going through if expected price does not match actual total price' do
    #   subject.order('tempura', 1)
    #   expect { subject.check_price(4) }.to raise_error 'Please check the price again'
    # end
  end

end