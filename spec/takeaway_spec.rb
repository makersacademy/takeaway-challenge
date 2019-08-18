require 'takeaway'

describe Takeaway do
  describe '#view_menu' do
    it 'displays the menu' do
      displayed_menu = "1. prawn cracker....£2\n2. spring roll....£3\n"
      menu_double =  double(:menu, display: displayed_menu)
      takeaway = Takeaway.new(menu_double.display)
      expect { takeaway.view_menu }.to output(displayed_menu).to_stdout
    end
  end

  describe '#add' do
    it 'adds dishes to basket' do
      subject.add('prawn cracker', 1)
      subject.add('spring roll', 2)
      expect(subject.basket).to eq({ 'prawn cracker' => 1, 'spring roll' => 2 })
    end

    it 'confirms if an order has been added' do
      message = "1x prawn cracker(s) added to your basket\n"
      expect { subject.add('prawn cracker', 1) }.to output(message).to_stdout
    end

    it 'raises error if a dish is not in the menu' do
      message = "burger is not available, please order from the menu"
      expect { subject.add('burger', 1) }.to raise_error(message)
    end
  end

  describe '#view_basket' do
    it 'shows dishes added to the basket' do
      subject.add('prawn cracker', 4)
      subject.add('spring roll', 2)
      message = "prawn cracker x4 = £8, spring roll x2 = £6\n"
      expect { subject.view_basket }.to output(message).to_stdout
    end
  end

  describe '#total' do
    it 'shows the total price for all the dishes ordered' do
      subject.add('crispy pork belly', 1)
      subject.add('boiled rice', 1)
      expect { subject.total }.to output("Total = £10.5\n").to_stdout
    end
  end

  describe '#checkout' do
    it 'sends a order confirmation text message with estimated delivery time' do
      msg = "Thank you for your order!"
      client = double(:client)
      twilio_inputs = { from: ENV['TWILIO_PHONE_FROM'], to: ENV['TWILIO_PHONE_TO'], body: msg }
      allow(client).to receive_message_chain(:messages, :create).with(twilio_inputs)
      expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
      subject.send_sms(msg)
    end
  end
end
