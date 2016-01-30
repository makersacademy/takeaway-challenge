require 'takeaway'


describe 'Takeaway Feature' do
  
  
  it 'Displays the list of restaurants and the chosen menu (1)' do
  
    takeaway = Takeaway.new
    allow(takeaway).to receive(:gets) {"1\n"}
    expect{ takeaway.menu }.to output("What cousine would you like?\n1 - Italian\n2 - Mexican\n3 - Indian\nPizza = £10.0\nPasta = £8.0\nMilanese = £14.0\n").to_stdout
    
  end

end
