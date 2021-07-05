require 'takeaway'
require 'sms_send'

feature 'User Stories' do
  let(:takeaway) {Takeaway.new(sms)}
  let(:message) {double(:message)}
  let(:sms) {double(:sms, send: message)}
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "I can see a list of dishes with prices" do
    expect(takeaway.list).to include("1 Kappa Maki => £8")
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "I can select a number of several dishes" do
    takeaway.order(1)
    expect(takeaway.order(2)).to eq [{"Kappa Maki" => 8}, {"Edamame" => 5}]
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "I can check the total matches the sum of dishes in my order" do
    takeaway.order(1)
    takeaway.order(1)
    takeaway.order(5)
    expect(takeaway.total).to eq 24
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it "I would like to recieve a text via sms regarding my order being placed" do
    takeaway.order(1)
    takeaway.order(2)
    expect(takeaway.send_sms).to eq message
  end
end
