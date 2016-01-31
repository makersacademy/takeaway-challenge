require 'takeaway'

describe 'User stories' do

  #1 User Story
  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  context 'to see a menu' do
    it 'returns a list of dishes with prices ' do
    takeaway = Takeaway.new(Messager.new)
      expect(takeaway.display_menu).to eq ({"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 })
    end
  end

  #2 User Story
  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes


  #3 User Story
  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given matches the sum of the various #dishes in my order





end
