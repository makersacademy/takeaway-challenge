require 'take_away'
require 'twilio-ruby'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, list: { "jerk chicken" => 5.59, "mamas meatballs" => 5.39 } }

  describe "#initialize" do
    it "has a menu list" do
      expect(takeaway.menu).to eq menu
    end
  end

  describe "#read_menu" do
    it "returns the menu" do
      expect(takeaway.read_menu).to eq menu.list
    end
  end

  describe "#order" do
    it "adds the dishes to the basket with default quantity" do
      takeaway.order("jerk chicken")
      expect(takeaway.basket.length).to eq 1
    end

    it "prints the message" do
      dish = "jerk chicken"
      expect(takeaway.order(dish, quantity = 1)).to eq "#{quantity}x #{dish}(s) added to your basket"
    end
  end

  describe "#basket" do
    it "allows to add the same dish more than once to the basket" do
      takeaway.order("mamas meatballs")
      takeaway.order("mamas meatballs", 2)
      expect(takeaway.basket).to eq "mamas meatballs" => 3
    end

    it "allows to add multiple dishes to the basket" do
      takeaway.order("jerk chicken", 1)
      takeaway.order("mamas meatballs", 2)
      expect(takeaway.basket).to eq "jerk chicken" => 1, "mamas meatballs" => 2
    end
  end

  describe "#basket_summary" do
    it "shows the prices for each ordered item" do
      takeaway.order("jerk chicken", 1)
      takeaway.order("mamas meatballs", 2)
      expect(takeaway.basket_summary).to eq "jerk chicken x1 = £5.59, mamas meatballs x2 = £10.78"
    end
  end

  describe "#total" do
    it "shows total price for the order" do
      takeaway.order("jerk chicken", 1)
      takeaway.order("mamas meatballs", 2)
      expect(takeaway.total).to eq "Total: £16.37"
    end
  end

  describe "#checkout" do

    before do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      takeaway.order("jerk chicken", 1)
      takeaway.order("mamas meatballs", 1)
      takeaway.total
    end

    it "returns message that order cannot be completed" do
      expect { takeaway.checkout(16.89) }.to raise_error "Check your total as it is incorrect"
    end

    let(:client) { double :client, messages: messages }
    let(:messages) { double :messages, create: nil }

    it "sends text message when order is completed" do
      takeaway.checkout(10.98)
      expect(Twilio::REST::Client).to have_received(:new)
    end
  end
end
