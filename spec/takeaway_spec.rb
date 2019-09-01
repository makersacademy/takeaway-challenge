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
    # place a double here perhaps? let(:menu) { double :menu, price: '£1.00', contains?: true }
  # subject(:order) { described_class.new(menu) }
    it "puts out the menu" do
      expect { subject.view_menu }.to output.to_stdout
    end
  end

  describe '#order_food' do
    it 'creates a new instance of Order' do
      subject.order_food('marinara')
      expect(subject.order).to be_an_instance_of(Order)
    end

    it 'lets the user select a dish and quantity' do
      subject.order_food('marinara')
      expect(subject.order.ordered_dishes).to eq(['1 x marinara'])
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
      subject.order_food('marinara')
      expect { subject.submit_order }.
      to output("Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.strftime('%M')}").to_stdout
    end
  end

end
