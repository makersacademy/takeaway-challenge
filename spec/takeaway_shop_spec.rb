require 'takeaway_shop'

describe TakeawayShop do

  subject( :shop ){ described_class.new }
  let( :order1 ){ double :order }
  let( :order2 ){ double :order }

  before( :each ) do
    allow( order1 ).to receive_message_chain( :order, :size ).and_return( 1 )
    allow( order1 ).to receive_message_chain( :order, :each )
    allow( order2 ).to receive_message_chain( :order, :size ).and_return( 1 )
    allow( order2 ).to receive_message_chain( :order, :each )
  end

  context "#menu" do
    it { is_expected.to respond_to :menu }
  end

  context "#take_orders" do

    it { is_expected.to respond_to( :take_orders ).with(1).argument }

    it "take several orders" do
     shop.take_orders( order1 )
     shop.take_orders( order2 )
     expect( shop.orders ).to eq [ order1, order2 ]
    end

    it "should return message" do
      expect( shop.take_orders( order1 )).to be_kind_of(String)
    end

  end

end
