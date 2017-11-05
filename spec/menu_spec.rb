require 'menu'

describe Menu do

  context 'prints menu information' do

    it '#read_menu prints MENU to screen' do
      expect(subject.read_menu).to eq "Choose Option for your order! (Input a Number)"
    end
 end

  context 'ordering food & quantity' do

    it '#order should enable user to order Satay' do
      subject.menu_functions(1,2)
      expect(subject.menu_functions(5)).to eq [{ :food => "Satay", :quantity => 2, :price => 10}]
    end
    it '#order should enable user to order RotiCanai' do
      expect(subject.menu_functions(2,2)).to eq [{ :food => "RotiCanai", :quantity => 2, :price => 18}]
    end
    it '#order should enable user to order Kuih' do
      expect(subject.menu_functions(3,2)).to eq [{ :food => "Kuih", :quantity => 2, :price => 6}]
    end
    it '#order should enable user to order NasiLemak'do
     expect(subject.menu_functions(4,2)).to eq [{ :food => "Nasi Lemak", :quantity => 2, :price => 20}]
   end
  end

end
