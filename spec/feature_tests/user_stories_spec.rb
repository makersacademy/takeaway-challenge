require 'takeaway'

describe "User stories" do

let(:takeaway) {Takeaway.new}
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  describe 'User Story 1' do

    it 'allows me to see a list of dishes with prices' do
      expect{takeaway.show_dishes}.to output("starter : 5\nmains : 10\ndesert : 3").to_stdout
    end
#expect { my_method }.to output("my message").to_stdout

  end

end
