require 'takeaway_shop'

describe TakeawayShop do

  subject( :shop ){ described_class.new }
  let( :order1 ){ double :order }
  let( :order2 ){ double :order }

  before( :each ) do
    allow( order1 ).to receive_message_chain( :order, :size ).and_return( 1 )
    allow( order1 ).to receive_message_chain( :order, :each )
    allow( order2 ).to receive_message_chain( :order, :size ).and_return( 2 )
    allow( order2 ).to receive_message_chain( :order, :each )
  end

  context "#menu" do
    it { is_expected.to respond_to :menu }
  end

  context "#take_orders" do

    it { is_expected.to respond_to( :take_order ).with(1).argument }

  end

  context "#send_text" do

    it { is_expected.to respond_to :send_text }

  end

end
