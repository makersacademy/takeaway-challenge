require 'restraunt'
require 'send-sms'
describe Restraunt do 

  describe '#add_to_order' do 

    it 'checks we can add to order' do 
      subject.add_to_order(:Jalfreezi)
      expect(subject.order_items).to eq [:Jalfreezi]
    end 

    it 'adds order to see if total price changes' do 
      expect { subject.add_to_order(:Jalfreezi) }.to change { subject.order_price }.by 5
    end 

    it 'checks we can add multiple items and return items' do 
      subject.add_to_order(:Jalfreezi)
      subject.add_to_order(:Pilau_Rice)
      expect(subject.order_items).to eq [:Jalfreezi, :Pilau_Rice]
    end 

    it 'checks we can add multiple items and return price' do 
      subject.add_to_order(:Jalfreezi)
      subject.add_to_order(:Pilau_Rice)
      expect(subject.order_price).to eq 6.5
    end 

    it 'checks we recieve error: item not on menu' do 
      expect { subject.add_to_order(:Chicken) }.to raise_error "item not on menu"
    end 

  end 

  describe '#complete_order' do
    let(:send_message_double) { double(:send_message, send_message: "message_sent") }
    it 'checks ETA for delivery to be displayed' do 
      restraunt = Restraunt.new(send_message_double)
      time = Time.now + 3600
      time_check = "Your order has been processed and is expected to arrive by: #{time.strftime("%H:%M%p")}"
      expect(restraunt.complete_order("placeholder_phonenumber")).to eq time_check
    end 

    it 'checks we send a confirmation' do 
      restraunt = Restraunt.new(send_message_double)
      expect(restraunt.send_confirmation("placeholder_phonenumber")).to eq "message_sent"

    end 
    
  end 

  describe '#menu' do 
    it 'checks the menu can be returned correctly' do 
      menu = { Jalfreezi: 5, Korma: 4, Chiken_Tikka_Masala: 5.5,
        Pilau_Rice: 1.5, Egg_Fried_Rice: 1.2 }
      expect(subject.menu).to eq menu 
    end 

  end 

end 
