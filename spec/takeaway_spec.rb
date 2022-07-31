require "./lib/takeaway"
require "./lib/menu"

describe Takeaway do
  let(:menu) { Menu.new }
  subject(:takeaway) { described_class.new }
  let(:client) { double :client, messages: messages } # messages being client method?
  let(:messages) { double :messages, create: nil } # create being messages method?

  describe "#view_menu" do
    it "returns the menu" do
      expect(takeaway.view_menu).to eq menu.menu
    end
  end

  describe "#order" do
    it "adds dish in specified quantity to the basket" do
      takeaway.order("pad thai", 2)
      takeaway.order("chow mein")
      expect(takeaway.basket).to eq ({ "pad thai" => 2, "chow mein" => 1 })
    end

    it "raises an error when there's no dish in the menu" do
      expect { takeaway.order("ramen") }.to raise_error "No such dish in the menu"
    end
  end

  describe "#total" do
    it "calculates the total value of the basket" do
      takeaway.order("pad thai", 2)
      expect(takeaway.total).to eq 21.0
    end
  end

  describe "#confirm_basket" do
    dish = "pad thai"
    quantity = 1
    specify { expect { takeaway.confirm_basket(dish, quantity) }.to output("#{quantity} x #{dish} has been added to your basket.").to_stdout }
  end

  describe "#checkout" do
    before do
      # receive(:new) to create new client object, and returning the client object
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
    end

    it "raises error if given amount differs from total value of order" do
      takeaway.total = 20.0
      expect { takeaway.checkout(15.0) }.to raise_error "Incorrect total order value"
    end

    it "sends a text message to confirm order" do
      takeaway.total = 8.0
      takeaway.checkout(8.0)
      # at verification stage I want to check if the Twilio Client
      # actually received new client object
      # therefore .to have_received and not .to receive
      expect(Twilio::REST::Client).to have_received(:new)
    end
  end
end
