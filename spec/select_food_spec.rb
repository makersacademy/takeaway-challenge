require 'select_food.rb'

describe SelectFood do
  # it "Should ask the customer what they want" do
  #   expect(subject.greeting).to eq ("Please select which dish you would like: ")
  # end

  # it "Should allow the customer to choose what they want" do
  #   allow($stdin).to receive(:gets).and_return("Pepsi max") 
  #   choice = $stdin.gets

  #   expect(choice).to eq "Pepsi max"
  # end

  describe '#user_choice' do
    before do 
      io_obj = double
      expect(subject)
      .to receive(:gets)
      .and_return(io_obj)
      .twice
      expect(io_obj)
      .to receive(:chomp)
      .and_return(:food)
      expect(io_obj)
      .to receive(:chomp)
      .and_return(:quantity)
    end
    it "Should allow the customer to choose what they want (type and quantity of food)" do
      subject.user_choice
      expect(subject.instance_variable_get(:@food)).to eq :food
      expect(subject.instance_variable_get(:@quantity)).to eq :quantity
    end
  end
  
end
