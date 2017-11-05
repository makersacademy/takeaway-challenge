require 'restaurant'
require 'takeaway_logo'


describe Restaurant do
  describe '#show_menu' do
    it 'Check if show_menu take into account the @list array' do
      expect(subject.show_menu).to eq([[:Pizza, 12], [:Patatine, 4], [:CocaCola, 3], [:Lasagne, 4], [:Polenta, 3]])
    end
  end

  describe '#select_dishes' do
    it "Select dishes the user choice" do
      allow(subject).to receive(:gets).and_return('1', '2', "")
      subject.food_and_quantity
      expect { subject.select_dishes }.to output("Your basket:\n2 Pizza\n").to_stdout
    end
  end

  describe '#food_and_quantity' do
    it "Ask to the user which dishes want to order and the quantity" do
      allow(subject).to receive(:gets).and_return('1', '2', '')
      expect { subject.food_and_quantity }.to output("Please write the number of the first dish you want to order. Then press Enter.\nWrite a number to indicate how many portion you wish.\nWrite the number of the next dish. If you've finish just press Enter.\n").to_stdout
    end
  end

  describe '#payment_message' do
    it "Check if payment_message puts the correct sum and message" do
      allow(subject).to receive(:gets).and_return('1', '2', "")
      subject.food_and_quantity
      expect { subject.payment_message }.to output("Total to pay: £8\n").to_stdout
    end
  end
  describe '#user_payment' do
    it 'check if the user is paying the correct amount of money' do
      allow(subject).to receive(:gets).and_return('1', '2', "")
      subject.food_and_quantity
      subject.select_dishes
      subject.payment_message
      allow(subject).to receive(:gets).and_return('24')
      expect { subject.user_payment }.to output("PAYMENT:\nPlease insert the amount of money:\nThanks your order has been accepted. Shortly you will receive an confirmation by sms.\n").to_stdout
    end
  end
end
