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

    it '#print(menu) should print a hash to the console' do
        expect { subject.print(menu) }.to output("Double Double: $4\nCheeseburger: $3\nHamburger: $2\nFrench Fries: $1\nMilkshake: $1\nSmall Soda: $1\n").to_stdout
    end

    it '#print_subtotal should print the order total to the console' do
        basket = Basket.new
        basket.order("Double Double")
        basket.order("Double Double")
        basket.order("Milkshake")
        expect { subject.print_order_total(basket.order_total) }.to output("Your order total is #{basket.order_total}\n").to_stdout
    end
end