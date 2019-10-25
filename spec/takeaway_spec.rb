require "takeaway"

describe TakeAway do

let {:takeaway} { TakeAway.new }

    it "can display the menu to the user" do
        expect(takeaway.menu).to eq({"Salmon sushi" => 2.99, 
        "Vegetable sushi" => 1.99,
        "Rice" => 1.59
        "Katsu chicken" => 2.99
    })
    end
end