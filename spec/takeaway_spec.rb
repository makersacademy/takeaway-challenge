require 'takeaway'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

describe Takeaway do
    let(:takeaway) {Takeaway.new}
    
    context 'menu' do
        it 'shows a menu list of 3 items' do
            expect(takeaway.menu.length).to eq 3
        end 

        it 'it contains a salad' do
            expect(takeaway.menu.include?('Salad')).to be true
        end 
    end 

    context 'order' do
        it 'allows customer to select a chosen quantity of dishes' do
            takeaway.order('Salad', 2)
            expect(takeaway.order_basket).to eq ['Salad', 'Salad']
        end 
    end 

          it 'adds the price of the dishes to the order basket' do
              takeaway.order('Salad', 3)
              takeaway.order('Pizza', 1)
              expect(takeaway.payment).to eq 23
         end 
    end 
     context 'total' do
        let(:takeaway) {Takeaway.new}

         it 'checks if the total matches the sum' do
             takeaway.order('Salad', 3)
             takeaway.order('Pizza', 1)
             expect(lambda{takeaway.total(10)}).to raise_error 'the total does not match the sum'
         end 
     end 
 
