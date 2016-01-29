require 'takeaway'


describe 'Takeaway Feature' do
  
  
  it 'Displays the list of restaurants' do
    
   
    takeaway = Takeaway.new
    allow(takeaway).to receive(:gets) {"1\n"}
    expect{ takeaway.menu }.to output("What cuisine would you like?\n1 - Italian\n2 - Mexican\n3 - Indian\n").to_stdout
    
  
  end

end
