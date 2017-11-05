require 'menu'

describe Menu do

  context 'prints menu information' do

    it '#read_menu prints MENU to screen' do
      expect(subject.read_menu).to eq "Choose Option for your order! (Input a Number)"
    end
 end

  context 'ordering food & quantity' do

    it '#order should enable user to order Satay' do
      expect(subject.order(1,2)).to eq ([["Satay", 2]])
    end
    it '#order should enable user to order RotiCanai' do
      expect(subject.order(2,2)).to eq ([["RotiCanai", 2]])
    end
    it '#order should enable user to order Kuih' do
      expect(subject.order(3,2)).to eq ([["Kuih", 2]])
    end
    it '#order should enable user to order NasiLemak'do
     expect(subject.order(4,2)).to eq ([["Nasi Lemak", 2]])
   end
  end

  context 'checking order in basket' do
    it '#check_basket should have more than two orders to basket' do
      subject.order(1,2)
      subject.order(2,2)
      expect {subject.check_basket}.to output("Total Order:\n\n2x Satay\n2x RotiCanai\n").to_stdout
    end
  end

end
