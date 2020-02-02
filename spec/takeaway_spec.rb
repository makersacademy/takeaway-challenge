require "takeaway"

describe Takeaway do
  it "1) Displays the menu of the food and prices " do 
    expect(subject.print_menu).to include({"Chicken wrap" => 4.00, "Chips" => 2.00, "Soda" => 1.00})
end


  

end