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

  describe 'order_list' do 
    it 'keeps track of the items ordered and number of each' do
      subject.order('tempura', 1)
      subject.order('gyoza', 1)
      subject.order('tempura', 1)
      expect(subject.order_list).to eq ['tempura', 'gyoza', 'tempura']
    end
  end
end