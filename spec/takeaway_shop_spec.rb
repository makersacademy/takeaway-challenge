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

  context "#customer" do
    it { is_expected.to respond_to :customer }

    it "should equal order and custumer" do
      shop.take_order( order1 )
      expect( shop.customer ).to eq order1
    end
  end

  context "#take_orders" do
    it { is_expected.to respond_to( :take_order ).with(1).argument }

    it "should record the time when taken a order " do
      allow( Time ).to receive( :now ).and_return( "15:00" )
      expect( shop.take_order( order1 )).to eq "15:00"
    end
  end

  context "#send_text" do
    it { is_expected.to respond_to :send_text }

    it "should send a text to tell the time for delivery( plus 1 hour from taking the order )" do
      allow( shop ).to receive( :twilio_sms_sending_process )
      order_hour = Time.now.hour + 1
      order_mins = Time.now.min
      shop.take_order( order1 )
      shop.send_text
      expect( shop.message ).to eq "Thank you! Your order was placed and will be delivered before #{ order_hour }:#{ order_mins }"
    end

  end

end
