require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to :menu }

  it 'has a way of populating the menu' do
    expect(subject).to respond_to(:create_menu).with(2).arguments
  end
  
end