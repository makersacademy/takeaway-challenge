class Menu
attr_reader :drinks, :food, :desert
    
def initialize
    @drinks = { "Coke" => 1.50,
        "Fanta" => 1.50,
        "Sprite" => 1.50,
        "Dr Pepper" => 1.5}
    
    @food = { "1/4 pounder burger" => 6.99,
        "1/4 pounder cheese burger" => 7.99,
        "Chicken Burger" => 5.99,
        "Vegan Burger" => 6.99}

    @desert = { "House Cheesecake" => 3.99,
        "Cookie Dough and Ice Cream" => 3.99,
        "Brownie and Ice Cream" => 3.99}
    end


end

