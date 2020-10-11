require 'print'
require 'menu'

describe Print do

    let(:menu) { {"Double Double" => 4.35,
        "Cheeseburger" => 3.15,
        "Hamburger" => 2.85,
        "French Fries" => 2.05,
        "Milkshake" => 2.45,
        "Small Soda" => 1.75 }
    }

    it '#print(menu) should print a hash to the console' do
        expect { subject.print(menu) }.to output("Double Double: $4.35\nCheeseburger: $3.15\nHamburger: $2.85\nFrench Fries: $2.05\nMilkshake: $2.45\nSmall Soda: $1.75\n").to_stdout
    end
end