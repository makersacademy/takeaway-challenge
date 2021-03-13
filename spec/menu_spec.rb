require 'menu'

describe Menu do 
    # User Story 1: As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it "responds to menu" do
        expect(subject).to respond_to(:pizzas) 
    end 
    it "prints a menu" do
        # menu_double = double("Pizza Menu")
        expect(subject.print_menu).to eq( {
            "cheese" => 10,
            "pepperoni" => 12,
            "hawaiian" => 13,
            "vegetarian" => 13,
            "meat" => 15 })
    end 
end 

