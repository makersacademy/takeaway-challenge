require 'menu'
require 'takeaway'
require 'order'
describe Takeaway do

  context "when Takeaway class is initialised" do
    it "it  creates a new instance of Menu" do
      expect(subject.menu).to be_an_instance_of(Menu)
    end
  end

  describe '#view_menu' do
    it "puts out the menu" do
      expect { subject.view_menu }.to output.to_stdout
    end
  end

  describe '#order_food' do
    context "an order has already been made" do
      before(:each) do
        subject.order_food('marinara')
      end
      it 'creates a new instance of Order' do
        expect(subject.order).to be_an_instance_of(Order)
      end

      it 'lets the user select a dish and quantity' do
        expect(subject.order.ordered_dishes).to eq(['1 x marinara'])
      end
    end

    it 'lets the user select a different quantity' do
      subject.order_food('marinara', 2)
      expect(subject.order.ordered_dishes).to eq(['2 x marinara'])
    end
  end

  describe '#check_order' do
    it 'checks the total of the order' do
      subject.order_food('marinara', 2)
      expect { subject.check_order }.to output(/Your total is £12.0/).to_stdout
    end
  end

  describe '#submit_order' do
    it 'sends your a confirmation text message' do
      text_message_double = double :text_message, send_text: "Thank you!", sms_send: true
      expect(subject.submit_order(text_message_double)).to eq true
    end
  end
end
