require 'restaurant.rb'
require 'menu.rb'


describe Restaurant do
  subject { 
    menu = double(Menu.new)
    allow(menu).to receive(:list) { { "fries" => 1.50, "burger" => 2.00 } }
    
    sender = "FAKE"
    allow(sender).to receive(:send).and_return("Twilio screen test confirmed")

    Restaurant.new(menu, sender) 
  }
 
  describe '#show_menu' do
    it 'outputs a hash of dishes and prices' do
      expect(subject.show_menu).to eq ({ "fries" => 1.50, "burger" => 2.00 })
    end
  end

  describe '#order' do
    it 'stores a customer order in a basket' do
      subject.order("fries", 3)
      expect(subject.basket).to include "fries" => 3
    end

  
    it 'increases the portions in basket when a dish is ordered again' do
      subject.order("fries")
      subject.order("fries")
      expect(subject.basket).to include "fries" => 2
    end

    it 'fails if dish unknown' do
      expect { subject.order("chips") }.to raise_error "Sorry, chips aren't on the menu"
    end
  end

  describe '#basket_summary' do
    it 'outputs subtotals for each of the dishes ordered' do
      subject.order("fries", 5)
      subject.order("burger", 5)
      expect(subject.basket_summary).to eq "5 portions of fries @ £1.50 each = £7.50, 5 portions of burger @ £2.00 each = £10.00"
    end
  end

  describe '#total' do
    it 'calculates the total amount owing' do
      subject.order("fries", 5)
      subject.order("burger", 5)
      expect(subject.total).to eq 17.5
    end
  end

  describe '#show_total' do
    it 'gives friendly string including total amount owing' do
      subject.order("fries", 5)
      subject.order("burger", 5)
      expect(subject.show_total).to eq "Total owing: £17.50"
    end
  end

  describe '#checkout' do

    it 'fails with insufficient payment' do
      subject.order("fries", 5)
      subject.order("burger", 5)
      expect { subject.checkout(10.00) }.to raise_error("Insufficient payment")
    end

    it 'asks Twilio to send a confirmation' do
      subject.order("fries", 5)
      subject.order("burger", 5)
      expect(subject.checkout(17.50)).to eq "Twilio screen test confirmed"
    end
  end
end
