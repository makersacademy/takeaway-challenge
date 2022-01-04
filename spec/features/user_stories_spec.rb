require 'takeaway'

# Takeaway Challenge User Stories

# 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe Takeaway do
  let(:sms) { double :sms, message: nil }
  let(:bobs_burritos) { described_class.new(menu_file: "./lib/fake_menu.csv", sms: sms) }
  
  describe '#menu' do
    it 'shows the customer a formatted menu' do
      expect { bobs_burritos.menu }.to output("#{"Welcome to Bob's Burritos!".rjust(57)}\n\n#{"Beef Burrito".rjust(40)} - dish: 1 -#{"£10.00".rjust(8)}\n#{"Chicken Burrito".rjust(40)} - dish: 2 -#{"£9.00".rjust(8)}\n#{"Veggie Burrito".rjust(40)} - dish: 3 -#{"£8.00".rjust(8)}\n").to_stdout
    end
  end

# 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  describe '#basket' do
    it 'shows items have been added to the basket' do
      bobs_burritos.order(dish: 1, x: 2)
      bobs_burritos.order(dish: 3, x: 4)
      expect { bobs_burritos.basket }.to output("\n#{"Your Basket of Burrito Goodness".rjust(40)}\n\n#{"Beef Burrito x 2     £20.00".rjust(40)}\n#{"Veggie Burrito x 4     £32.00".rjust(40)}\n\n#{"Total:    £52.00".rjust(40)}\n").to_stdout
    end
  end

# 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
# This is fulfilled as the total displays with #basket

# 4
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  describe '#checkout' do
    it 'sends a confirmation message to the customer' do
      t = Time.now + (60 * 60)
      expect(bobs_burritos.checkout('5551342')).to eq("Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}")
    end

    it 'messages sms service' do
      bobs_burritos.checkout('5551342')
      expect(sms).to have_received(:message)
    end
  end
end
