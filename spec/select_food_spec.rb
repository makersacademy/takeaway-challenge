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

  describe '#user_order' do
    # before do
    #   io_obj = double
    #   expect(subject)
    #   .to receive(:gets)
    #   .and_return(io_obj)
    #   .twice
    #   expect(io_obj)
    #   .to receive(:chomp)
    #   .and_return("Cheese and tomato pizza")
    #   expect(io_obj)
    #   .to receive(:chomp)
    #   .and_return("1")
    # end
    # it "Should contain the food and quantity choices made by the user" do
    #   subject.user_order
    #   expect(subject.current_choice).to eq ({"Cheese and tomato pizza" => "1"})
    # end

    # it "adds the @current_choice to the @current_order" do
    #   subject.user_order
    #   expect(subject.current_order).to eq([{"Cheese and tomato pizza" => "1"}])
    # end

    before do
      io_obj = double
      expect(subject)
      .to receive(:gets)
      .and_return(io_obj)
      .exactly(4).times
      expect(io_obj)
      .to receive(:chomp)
      .and_return("Cheese and tomato pizza")
      expect(io_obj)
      .to receive(:chomp)
      .and_return("1")
      expect(io_obj)
      .to receive(:chomp)
      .and_return("Pepsi max")
      expect(io_obj)
      .to receive(:chomp)
      .and_return("1")
    end
    it "adds choices to the @current_order more than once (testing twice)" do
      subject.user_order
      expect(subject.current_order).to eq([{"Cheese and tomato pizza" => "1"}, {"Pepsi max" => "1"}])
    end







    
  end

  it "should have a place for the order to be stored while it is being processed" do
    expect(subject.current_order).to be_a(Array)
  end
  
  
end


# TODO
# find if there is a way to test "Does a loop have a break" before setting up an infinite loop. Right now the loop is infinite because of the order I've been adding stuff to it. 