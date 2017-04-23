# Feature tests for take_away
describe Interface do
  #  As a customer
  #  So that I can check if I want to order something
  #  I would like to see a list of dishes with prices
  before { subject.process_response(1) }
  describe 'Can access and print menu as a selection from the interface' do
    expect(subject.print_menu).to recieve(:process_response) 
  end
  #  As a customer
  #  So that I can order the meal I want
  #  I would like to be able to select some number of several available dishes

  #  As a customer
  #  So that I can verify that my order is correct
  #  I would like to check that the total I have been given matches the sum of the various dishes in my order

  #  As a customer
  #  So that I am reassured that my order will be delivered on time
  #  I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
