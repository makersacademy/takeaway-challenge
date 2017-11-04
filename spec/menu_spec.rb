require 'menu'

describe Menu do

  context 'prints menu information' do

    it '#read_menu prints MENU to screen' do
      expect(subject.read_menu).to eq "Choose Option for your order! (Input a Number)"
    end
 end

  context 'ordering food & quantity' do

    it '#order should order Satay' do
      subject.order(1)
      expect(subject.order(1)).to eq ("Satay")
    end
  end

end
