require 'restaurant.rb'
require 'menu.rb'

describe Restaurant do
  subject { 
    menu = double(Menu.new)
    allow(menu).to receive(:list) { { "fries" => 1.50, "burger" => 2.00 } }
    
    sender = double(SendSMS.new)
    #allow(sender).to receive(:send).with("to", "message").and_return("Twilio screen test confirmed")

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

  # describe '#delivery_time' do
  #   it 'outputs a time 1 hour from now' do
  #     moment = 2021-05-08 16:05:51 +0100
  #     allow(Time).to receive(:new) { moment }
  #     expect(subject.delivery_time).to eq "2021-05-08 17:05:51 +0100"
  #   end
  # end

  describe '#confirmation' do
    it 'asks the Twilio API to send a text' do
      expect(subject.confirmation("fakemobnum")).to eq "Twilio screen test confirmed"
    end
  end

  describe '#total' do
    it 'outputs the total amount owing' do
      subject.order("fries", 5)
      subject.order("burger", 5)
      expect(subject.total).to eq "Total owing: £17.50"
    end
  end

  
end
