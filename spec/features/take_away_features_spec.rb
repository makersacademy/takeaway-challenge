describe 'Features' do

  let(:select1) { {item_n: 0, quantity: 1} }
  let(:select2) { {item_n: 1, quantity: 1} }

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  describe 'A customer prints the menu to see available dishes/prices' do
    it 'TakeAway.show_menu displays the menu in the terminal window' do
      expect { TakeAway.show_menu }.to output(
        "0 - Roast pork - £15\n"\
        "1 - Steamed broccoli - £3\n"\
        "2 - Roasted spinach - £8\n"\
        "3 - Smelly fruit - £12\n").to_stdout
    end
  end 


  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes
  describe 'A customer selects a number of available dishes' do
    it 'Takeaway.order allows the user to place an order' do
      expect { TakeAway.order(18, '+447733362000', select1, select2) }.not_to raise_error
    end
  end


  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given 
  #matches the sum of the various dishes in my order 
  describe 'A customer provides the wrong total' do
    it 'TakeAway.order raises an error' do
      price_error = TakeAway::PRICE_ERROR
      expect {TakeAway.order(19, '+447733362000', select1, select2)}.to raise_error(price_error)
    end
  end

  #As a customer
  #So that I am reassured that my order will be delivered on time
  #I would like to receive a text such as "Thank you! Your order was 
  #placed and will be delivered before 18:52" after I have ordered
  describe 'A customer selects a number of available dishes' do
    it 'Takeaway.order sends a text message to the number provided via API' do 
      expect_any_instance_of(SmsInterface).to receive(:send_text) 
      TakeAway.order(18, '+447733362000', select1, select2)
    end 
  end
  
end 
