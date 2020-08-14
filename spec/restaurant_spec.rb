require "restaurant"

describe Restaurant do 

  it "can serve customers" do 
    expect(subject).to respond_to(:customers)
  end

end