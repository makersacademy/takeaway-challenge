require "sushi_shop"

describe SushiShop do
  subject( :shop ){ described_class.new }
  let( :order1 ){ double :order1 }
  let( :order2 ){ double :order2 }

  before( :each ) do
    allow( order1 ).to receive_message_chain( :order, :size ).and_return( 1 )
    allow( order1 ).to receive_message_chain( :order, :each )
    allow( order2 ).to receive_message_chain( :order, :size ).and_return( 1 )
    allow( order2 ).to receive_message_chain( :order, :each )
  end

  it { is_expected.to respond_to :menu }

  it "show a list of dishes with prices(Float)" do
    price = nil
    ( shop.menu ).each_value{ | value | price = value }
    expect( price ).to be_kind_of( Float )
  end

end
