# Unit Test
require 'pry'

describe 'user_stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'displays the food menu with prices' do
    my_menu = Menu.new
    expected_values = my_menu.display
    expected_values.each do |key, value|
      price = key
      food  = value
      expect(price).equal?(food)
    end
  end

  it 'lets the customer select from the menu' do
    # As a customer So that I can order the meal I want I
    # would like to be able to select some number of several
    # available dishes
    my_menu = Menu.new
    my_lunch = []
    my_options = my_menu.display
    # expect(my_menu.display.select).to respond_to{ |key, _| food_selected.include? key }
    my_options.each do |key, value|
      if key.to_i < 6
        my_lunch.push(value)
      end
    end
  end

  it 'check the total of given matches my selected items' do
    # As a customer So that I can verify that my order is correct I
    # would like to check that the total I have been given matches
    # the sum of the various dishes in my order
    my_menu = Menu.new
    my_lunch = []
    total = 0
    my_options = my_menu.display
    my_options.each do |key, value|
      if key.to_i < 6
        my_lunch.push(key)
      end
    end
    my_lunch.each do |x|
      total += x.to_i
    end
    expect(my_menu.calculate).to eq(total)
  end

  # it 'sends me a message to tell me when my order will arrive' do
  #   # As a customer So that I am reassured that my order will be delivered
  #   # on time I would like to receive a text such as "Thank you! Your order
  #   # was placed and will be delivered before 18:52" after I have ordered
  #
  #   account_sid = "*******************************"
  #   auth_token = "********************************"
  #
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   message = @client.messages.create(
  #       body: "Thank You! Your order has been placed!",
  #       to:   "+444573910384",
  #       from: "+443450924051")
  #   end
  end
