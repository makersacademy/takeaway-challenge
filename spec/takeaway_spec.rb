require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new} 

  it "can see the menu" do
    expect(subject.see_menu).to eq("Potato Wedges £2.50, Fish&Chips £8.50, Chicken Wings £5.99")
  end
    
end
