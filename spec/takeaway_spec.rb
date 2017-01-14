require 'takeaway'

describe Takeaway do

  context '#welcome' do
    it 'displays a welcome message to customers' do
      takeaway = Takeaway.new
      expect { takeaway.welcome }.to output("Welcome to Shirt and Thai! Please look at the menu and make your selection\n").to_stdout
    end
  end
  it 'can display a list of dishes to the user' do
    expect{subject.pretty_output(Takeaway::ALL)}.to output.to_stdout
  end
end
