require 'takeaway'

describe "User stories" do

let(:takeaway) {Takeaway.new}
let(:menu) {"starter : 5\nmains : 10\ndesert : 3"}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  describe 'User Story 1' do

    it 'allows me to see a list of dishes with prices' do
      expect{takeaway.show_dishes}.to output(menu).to_stdout
    end

  end

end
