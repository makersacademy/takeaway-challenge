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
      subject.menu_functions(2,2)
      expect(subject.menu_functions(5)).to eq [{ :food => "RotiCanai", :quantity => 2, :price => 18}]
    end
    it '#order should enable user to order Kuih' do
      subject.menu_functions(3,2)
      expect(subject.menu_functions(5)).to eq [{ :food => "Kuih", :quantity => 2, :price => 6}]
    end
    it '#order should enable user to order NasiLemak'do
    subject.menu_functions(4,2)
     expect(subject.menu_functions(5)).to eq [{ :food => "Nasi Lemak", :quantity => 2, :price => 20}]
   end
   it '#order multiple foods' do
     subject.menu_functions(2,2)
     subject.menu_functions(1,2)
     expect(subject.menu_functions(5)).to eq [{ :food => "RotiCanai", :quantity => 2, :price => 18}, { :food => "Satay", :quantity => 2, :price => 10}]
 end
end

  context 'checking whether basket is empty' do

    it '#menu_functions should be able to say whether basket is empty' do
      expect{subject.menu_functions(5)}.to output("Basket is currently empty\n").to_stdout
  end
end

  context 'User should be able to exit to check-out' do

    it '#menu_functions should check whether possible to pay' do
      subject.menu_functions(1,2)
      expect{subject.menu_functions(7)}.to output("Cool! You're total amount is $10! See ya at checkout\n").to_stdout
    end
  end

  context 'User should be able to check-out' do

    it '#check_out should be able to check if payment aint enough' do
      subject.menu_functions(1,2)
      subject.menu_functions(5)
      expect{subject.check_out(6)}.to output("Sorry, wrong amount for payment.\n").to_stdout
    end
    it '#check_out should be able to give change' do
      subject.menu_functions(1,2)
      subject.menu_functions(5)
      expect{subject.check_out(15)}.to output("Here's your change! $5! You'll hear a confirmation soon!\n").to_stdout
    end
    it '#check_out should be able to be able to say the checkout is right!' do
      subject.menu_functions(1,2)
      subject.menu_functions(5)
      expect{subject.check_out(10)}.to output("Perfect! You'll hear a confirmaton soon!\n").to_stdout
    end
  end
end
