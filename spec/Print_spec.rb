require 'Print.rb'

describe Print do
  describe '#print_dishes' do
    it 'prints items given in argument as a hash' do
      expect{subject.print_dishes("Hamburger"=>5, "Pizza"=>6)}.to output("Dish: Hamburger, Price: £5\nDish: Pizza, Price: £6\n").to_stdout
    end
end
end
