require 'takeaway'

describe Takeaway do
  let(:sms) { double :sms, message: nil }
  let(:takeaway) { described_class.new(menu_file: "./lib/fake_menu.csv", sms: sms) }

  describe '#menu' do
    it 'shows the customer a menu' do
      expect { takeaway.menu }.to output("#{"Welcome to Bob's Burritos!".rjust(57)}\n\n#{"Beef Burrito".rjust(40)} - dish: 1 -#{"£10.00".rjust(8)}\n#{"Chicken Burrito".rjust(40)} - dish: 2 -#{"£9.00".rjust(8)}\n#{"Veggie Burrito".rjust(40)} - dish: 3 -#{"£8.00".rjust(8)}\n").to_stdout
    end
  end

  describe '#order' do
    it 'confirms items are added to the order' do
      expect(takeaway.order(dish: 3, x: 4)).to eq("4 x Veggie Burrito - added to your order :)")
    end  
  end

  describe '#basket' do
    it 'displays the items contained' do
      takeaway.order(dish: 1, x: 2)
      takeaway.order(dish: 3, x: 4)
      expect { takeaway.basket }.to output("\n#{"Your Basket of Burrito Goodness".rjust(40)}\n\n#{"Beef Burrito x 2     £20.00".rjust(40)}\n#{"Veggie Burrito x 4     £32.00".rjust(40)}\n\n#{"Total:    £52.00".rjust(40)}\n").to_stdout
    end  
  end

  describe '#checkout' do
    it 'sends a confirmation message to the customer' do
      t = Time.now + (60 * 60)
      expect(takeaway.checkout('5551342')).to eq("Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}")
    end
  end
end
