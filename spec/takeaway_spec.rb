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

  it { is_expected.to respond_to(:order_confirm) }

  it { is_expected.to respond_to(:text) }


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
  end

  describe 'order_confirm' do
    it 'stops the order going through if expected price does not match actual total price' do
      subject.order('tempura', 1)
      subject.check_price(6)
      expect { subject.order_confirm }.to raise_error 'Please check the price again'
    end

    it 'triggers a confirmation text message' do
      allow(subject).to receive(:check_price).and_return true
      subject.order_confirm
      expect(subject.text).to eq(true)
    end
  end

end