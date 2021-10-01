require 'rspec'
require 'order'

RSpec.describe Order do
  describe '#place order' do 
    it 'places order' do
      menu = Menu.new
      expect(subject.place_order(:chips, :lamb_shish, :soft_drink)).to eq [3,10,2]
    end
  end

  describe 'order_total' do
    it 'totals price of items ordered' do
      menu = Menu.new
      subject.place_order(:chips, :lamb_shish, :soft_drink)
      expect(subject.order_total).to eq 15
    end
  end

  describe '#order_confirmation' do
    it 'confirms the order' do
      menu = Menu.new
      subject.place_order(:chips, :lamb_shish, :nil)
      expect(subject.order_confirmation).to eq "Thank you for placing your order at Aisha's Bistro. You have ordered: [:chips, :lamb_shish]. Your total is £13."
    end
  end

end