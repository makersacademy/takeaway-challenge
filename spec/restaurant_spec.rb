require "restaurant"
describe Restaurant do
  
  it "responds to print_menu" do
    expect(subject).to respond_to(:print_menu)
  end 

  describe "#print_menu" do
    it "returns a menu object" do
      expect(subject.print_menu).to be_an_instance_of(Menu)
    end 
  end 
end