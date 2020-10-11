require 'print'
require 'menu'

describe Print do

    it '#print(menu) should print a hash to the console' do
        menu = Menu.new.menu
        expect(subject.print(menu)).to output("Double Double: $4.35\nCheeseburger: $3.15\nHamburger: $2.85\nFrench Fries: $2.05\nMilkshake: $2.45\nSmall Soda: $1.75\n").to_stdout
    end
end