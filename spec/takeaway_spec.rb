require 'takeaway' 

describe TakeAway do
  
  it "responds to the show_menu method" do
    expect(subject).to respond_to(:show_menu)
    
  end
  
  it "responds to the order method" do
    expect(subject).to respond_to(:order)
  end
  
  
end