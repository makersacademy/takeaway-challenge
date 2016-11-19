require "pizza_shop"

describe PizzaShop do
  subject( :shop ){ described_class.new }
  let( :order1 ){ double :order }
  let( :order2 ){ double :order }

  it { is_expected.to respond_to :menu }

  it "show a list of dishes with prices(Float)" do
    price = nil
    ( shop.menu ).each_value{ | value | price = value }
    expect( price ).to be_kind_of( Float )
  end

  context "check the inheritance from TakeawayShop class" do

    context "#take_orders" do
      it { is_expected.to respond_to( :take_orders ).with(1).argument }
      it "take orders" do
       shop.take_orders( order1 )
       expect( shop.take_orders( order2 ) ).to eq [ order1, order2 ]
      end
    end

  end

end
