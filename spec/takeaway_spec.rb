require "takeaway"

describe TakeAway do
  subject(:takeaway) {TakeAway.new}

  describe "#initialize" do
    it "begins with a menu" do
      expect(takeaway.menu).to_not be nil
    end

    it "begins with an empty basket" do
      expect(takeaway.basket).to be_empty
    end
  end

  describe "#see_menu" do
    it "allows customer to see the menu" do
      expect(takeaway).to respond_to(:see_menu)
    end

    it "displays the menu list" do
      expect(takeaway.see_menu).to eq takeaway.menu
    end
  end

  describe "#order" do
    before (:each) do
      takeaway.menu = {:dish => 2.99}
    end
    it "adds one ordered dish to basket as default" do
      takeaway.order(:dish)
      expect(takeaway.basket).to eq [{:dish => 2.99}]
    end
    it "adds multiple ordered dishes to basket" do
      takeaway.order(:dish, 3)
      expect(takeaway.basket).to eq [{:dish => 2.99}, {:dish => 2.99}, {:dish => 2.99}]
    end
    it "assigns prices to ordered dishes" do
      takeaway.order(:dish)
      expect(takeaway.basket[0]).to eq :dish => 2.99
    end
    it "confirms the order" do
      expect(takeaway.order(:dish, 3)).to eq "3x dish(s) added to your basket."
    end
  end

  describe "#see_basket" do
    before (:each) do
      takeaway.menu = {:dish => 2.99}
      takeaway.order(:dish)
    end
    it "allows customer to see the basket" do
      expect(takeaway).to respond_to(:see_basket)
    end

    it "displays the basket" do
      expect(takeaway.see_basket).to eq takeaway.basket
    end
  end

  describe "#basket_total" do
    it "gives the total price of the basket" do
      takeaway.basket = {:dish => 2.99}, {:dish2 => 5.99}
      expect(takeaway.basket_total).to eq 8.98
    end
  end

  describe "#basket_summary" do
    it "displays the basket and total price" do
      takeaway.basket = {:dish => 2.99}, {:dish2 => 5.99}
      summary = "Total = £8.98, Basket = [{:dish=>2.99}, {:dish2=>5.99}]"
      expect(takeaway.basket_summary).to eq summary
    end
  end

  context "correct payment is made" do

    describe "#checkout" do
      it "allows customer to pay a specific amount" do
        expect(takeaway).to respond_to(:checkout).with(1).argument
      end
      it "confirms payment" do
        takeaway.basket_total = 7
        confirmation = "Thank you for your payment of £7."
        expect(takeaway.checkout(7)).to eq confirmation
      end
    end

    describe "#send_text"do
      it "sends a payment confirmation text message" do
        expect(takeaway).to respond_to(:send_text).with(1).argument
      end
      it "includes a message within the text" do
        client = double(:client)
        message = "Thank you for your payment of £7."
        twilio_message_body = {from: ENV['TWILIO_NUMBER'], to: ENV['TWILIO_MY_NUMBER'], body: message}
        allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
        expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
        subject.send_text(message)
      end
    end
  end

  context "incorrect payment is made" do

    describe "#checkout" do
      it "allows customer to pay a specific amount" do
        expect(takeaway).to respond_to(:checkout).with(1).argument
      end
      it "returns an error if payment is incorrect" do
        takeaway.basket_total = 7
        message = "Please pay the correct amount of £7."
        expect{takeaway.checkout(5)}.to raise_error(message)
      end
    end
  end
end


# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# feature test 1
# takeaway = TakeAway.new
# takeaway.see_menu
# #returns hash - list of food with prices

# feature test 2
# takeaway = TakeAway.new
# takeaway.see_menu
# takeaway.order(:wonton_soup)
# takeaway.basket = [:wonton_soup]
# takeaway.order(:spring_roll, 5)
# takeaway.basket = [:wonton_soup, :spring_roll, :spring_roll, :spring_roll, :spring_roll, :spring_roll]

# feature test 3
# takeaway = TakeAway.new
# takeaway.see_menu
# takeaway.order(:spring_roll)
# takeaway.basket_summary = "Total = £2.99, Basket = [{:spring_roll=>2.99}]"
# takeaway.checkout(2.50) = "Please pay the correct amount of £2.99"
# takeaway.checkout(2.99) = "Thank you for your payment of £2.99"

# feature test 4
# # takeaway = TakeAway.new
# # takeaway.see_menu
# # takeaway.order(:spring_roll)
# # takeaway.basket_summary = "Total = £2.99, Basket = [{:spring_roll=>2.99}]"
# takeaway.checkout(2.99) = "Thank you for your payment of £2.99"
#                           "A text has been sent to you as confirmation"
