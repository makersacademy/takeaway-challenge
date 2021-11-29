require 'menu'
require 'dish'

describe Menu do
  let(:dish2) { instance_double(Dish, :name => "chips", :price => 2.50) }
  let(:dish1) { instance_double(Dish, :name => "burger", :price => 4.00) }
  let(:dish3) { instance_double(Dish, :name => "pepsi", :price => 1.00) }
  
  subject { described_class.new(dish1, dish2, dish3) }
  describe '#view_menu' do
    it 'displays the menu' do
      expect(subject.view_menu).to eq "burger: £4.00\nchips: £2.50\npepsi: £1.00\n"
    end
  end
end