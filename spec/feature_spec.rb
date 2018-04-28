require './spec/spec_helper.rb'

feature "Take Away Challenge" do

  menu = [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},
    {dish: 'Vegeterian', price: '7.99'},
    {dish: 'Four Seasons', price: '5.99'},
    {dish: 'Seafood' , price: '8.99'},
    {dish: 'Margerita' , price: '4.99'},
    {dish: 'Ceasar Salad' , price: '5.90'}
   ]

   let(:dishes) {Dishes.new(menu)}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  scenario "Print Menu" do 
    expect(dishes.menu.count).to eq 7
    dishes.menu
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  scenario "Select from menu" do

  end
end
