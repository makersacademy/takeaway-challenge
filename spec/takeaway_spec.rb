require 'menu'
require 'takeaway'
require 'order'
describe Takeaway do
  subject(:takeaway) { described_class.new }

  context "when Takeaway class is initialised" do
    it "it  creates a new instance of Menu" do
      expect(takeaway.menu).to be_an_instance_of(Menu)
    end
  end

  describe '#view_menu' do
    it "puts out the menu" do
      expect { takeaway.view_menu }.to output.to_stdout
    end
  end

  describe '#order_food' do
    context "an order has already been made" do
      before(:each) do
        takeaway.order_food('marinara')
      end
      it 'creates a new instance of Order' do
        expect(takeaway.order).to be_an_instance_of(Order)
      end

      it 'lets the user select a dish and quantity' do
        expect(takeaway.order.ordered_dishes).to eq(['1 x marinara'])
      end
    end

    it 'lets the user select a different quantity' do
      takeaway.order_food('marinara', 2)
      expect(takeaway.order.ordered_dishes).to eq(['2 x marinara'])
    end
  end

  describe '#check_order' do
    it 'checks the total of the order' do
      takeaway.order_food('marinara', 2)
      expect { takeaway.check_order }.to output(/Your total is £12.0/).to_stdout
    end
  end

  describe '#submit_order' do
    it 'sends your a confirmation text message' do
      text_message_double = double :text_message, send_text: "Thank you!", sms_send: true
      expect(takeaway.submit_order(text_message_double)).to eq true
    end
  end
end
