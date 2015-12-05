describe 'User Stories' do

  describe 'Takeaway' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'should display a list of dishes with prices' do
      takeaway = Takeaway.new
      expect(takeaway.list).not_to be_empty
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'should allow user to select some number of several dishes' do
      takeaway = Takeaway.new
      takeaway.choose("Dish 1")
      expect(takeaway.order).not_to be_empty
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of
    # the various dishes in my order
    xit "the customer's total should match the sum of dishes in the order" do

    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed
    # and will be delivered before 18:52" after I have ordered
    xit "should send a text to confirm the order was placed" do

    end
  end

end
