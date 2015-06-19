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

end