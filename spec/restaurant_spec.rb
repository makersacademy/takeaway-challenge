require "restaurant"
describe Restaurant do
  
  it "Responds to print_menu" do
    expect(subject).to respond_to(:print_menu)
  end 
end