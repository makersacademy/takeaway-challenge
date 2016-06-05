describe "User Stories" do

  subject(:take_away) { TakeAway.new }

  before do
    allow(take_away).to receive(:gets).and_return("2-pizza, 3-Wrap")
    allow(take_away).to receive(:send_message)
  end
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  #
    it 'So I can check if I want to order food, shows the menu' do
      expect{ take_away.show_menu }.not_to raise_error
    end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
    it 'So I can order, I want to be able to select some dishes' do
      take_away.show_menu
      expect{ take_away.take_order }.not_to raise_error
    end
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
   it 'So I can check the order is correct, it gives me the total price' do
     take_away.take_order
     expect { take_away.order_price }.not_to raise_error
   end
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as
  # "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered




end
