require 'print'
require 'menu'
require 'basket'

describe Print do

    let(:menu) { {"Double Double" => 4,
        "Cheeseburger" => 3,
        "Hamburger" => 2,
        "French Fries" => 1,
        "Milkshake" => 1,
        "Small Soda" => 1 }
    }
    let(:basket) {Basket.new}

    it '#print_menu(menu) should print a hash to the console' do
        expect { subject.print_menu(menu) }.to output("Double Double: $4\nCheeseburger: $3\nHamburger: $2\nFrench Fries: $1\nMilkshake: $1\nSmall Soda: $1\n").to_stdout
    end

describe 'Printing related to baskets' do

    before do 
        basket.add_to_basket("Double Double")
        basket.add_to_basket("Double Double")
        basket.add_to_basket("Milkshake")
    end

    it '#print_order_total should print the order total to the console' do
        expect { subject.print_order_total(basket.order_total) }.to output("Your order total is #{basket.order_total}\n").to_stdout
    end

    it '#print_basket should print the items in the basket' do
        expect {subject.print_basket(basket.basket)}.to output("1.Double Double\n2.Double Double\n3.Milkshake\n").to_stdout
    end 
    
    end 
end