require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to :menu }
  
  it { is_expected.to respond_to :show_menu }

  describe 'show_menu' do
    it 'displays a list of dishes and prices' do
      dish = double :dish , name: 'Pizza', price: 8
      expect(takeaway.show_menu).to eq ("pizza: 8")
    end
  end

end