require 'menu'

describe Menu do

  context 'prints menu information' do

    it '#read_menu prints MENU to screen' do
      expect(subject.read_menu).to eq "Choose Option for your order! (Input a Number)"
    end
 end

  context 'ordering food & quantity' do

    it '#order should enable user to order Satay' do
      subject.order(1)
      expect(subject.order(1)).to eq ("Satay")
    end
    it '#order should enable user to order RotiCanai' do
      subject.order(2)
      expect(subject.order(2)).to eq ("RotiCanai")
    end
    it '#order should enable user to order Kuih' do
      subject.order(3)
      expect(subject.order(3)).to eq ("Kuih")
    end
    it '#order shoudl enable user to order NasiLemak'do
     subject.order(4)
     expect(subject.order(4)).to eq ("Nasi Lemak")
   end
  end

end
