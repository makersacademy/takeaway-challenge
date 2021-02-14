require 'takeaway'

describe Takeaway do
  let(:texter) { double(:texter) }
  let(:basket) { double(:basket, total: 1.00) }
  let(:dish) { double(:dish, downcase: "dish") }
  let(:menu) { double(:menu, display: "something") }
  subject { Takeaway.new(menu, basket, texter) }

  describe '#show_menu' do
    it 'displays the menu' do
      expect(menu).to receive(:display)
      subject.show_menu
    end
  end

  describe '#order' do
    it 'orders items from the menu and tells user it is in basket' do
      allow(basket).to receive(:store).with("dish", 1, nil)
      allow(menu).to receive(:items).and_return({})
      allow(menu).to receive(:price).with("dish")
      allow(menu).to receive(:has?).with("dish").and_return(true)
      expect(subject.order(dish)).to eq("1 x dish has been added to your basket")
    end

    it "tells user item ordered is not in menu if it menu doesn't have it" do
      something = double
      message = "Sorry! We don't have what you've just ordered. Check the menu for what's on offer!"
      allow(something).to receive(:downcase)
      allow(menu).to receive(:has?).with(nil)
      expect(subject.order(something)).to eq(message)
    end
  end

  describe '#basket_summary' do
    it "shows an empty basket if nothing is ordered" do
      allow(basket).to receive(:show_basket)
      expect { subject.basket_summary }.to output("").to_stdout
    end
  end

  describe '#total' do
    it "displays the total amount of the basket" do
      allow(basket).to receive(:total).and_return(1.00)
      expect(subject.show_total).to eq("Total: £1.00")
    end
  end

  describe '#checkout' do
    it "checkouts the order by checking if the amount given is correct" do
      expect(subject).to receive(:correct_amount?)
      subject.checkout(1.00)
    end

    it "completes the order after checking out" do
      expect(subject).to receive(:complete_order)
      subject.checkout(1.00)
    end

    it "sends a text when completing order after checcking out" do
      expect(texter).to receive(:send_text)
      subject.checkout(1.00)
    end
  end
end
