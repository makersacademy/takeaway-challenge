require 'order'
require 'menu'


describe Order do
  subject(:order) { described_class.new }
  let(:item) { double(:item) }

  describe '#order_item' do
    before do
      order.order_item("chicken")
    end
    it "stores chosen item to hash" do

     expect(order.basket).to(have_key(:chicken))
    end
  end

  describe '#check_item' do
    it "fails if item chosen is not in menu" do
       expect{subject.check_item("chocolate")}.to(raise_error("Sorry, that item is not on the menu"))
    end
  end


end
