require 'takeaway'

RSpec.describe Takeaway do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices


  it { is_expected.to respond_to(:order).with(2).arguments }


  describe '#Read menu functionality' do
    it { is_expected.to respond_to(:show_menu) }

    it 'When passed menu object, show menu' do
      thai = Takeaway.new
      expect(thai.show_menu).to eq(Menu::MENU)
    end
  end


end