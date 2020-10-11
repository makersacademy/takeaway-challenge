require 'Menu.rb'
require 'BillCalculator.rb'

describe Menu do
  let(:dish) { double :dish }
  let(:price) { double :price }

    describe '#select' do

      it 'Edge case: if non hash given then error is returned' do
        expect{subject.select("this is not a hash")}.to raise_error('Selection must be entered in the format ":dish=>quantity"')
      end

      it 'Edge case: quantity not integer' do
        expect{subject.select(:Hamburger=>"2")}.to raise_error('Quantity must be an integer e.g. 4')
      end

      it 'Edge case: dish given is not a symbol' do
        expect{subject.select("Hamburger"=>2)}.to raise_error('Dish selected must be a symbol e.g. :Hamburger')
      end

    end

    describe '#print_all' do
      it 'prints all dishes using the Print class' do
        expect{subject.print_all}.to output("Dish: Hamburger, Price: £5\nDish: Pizza, Price: £6\nDish: Pasta, Price: £4\nDish: Fish_and_chips, Price: £5\nDish: Salad, Price: £3\nDish: Lamb_Shank, Price: £7\n").to_stdout
      end
    end

    describe '#my_total' do
      let(:total) {double :total}
      let(:actual_total) {double :actual_total}

        it 'check that if total entered is incorrect an error is given' do
          subject.select(:Hamburger=>3, :Pizza=>2, :Salad=>5)
          expect{ subject.my_total(41)}.to raise_error("Total entered (£41) is incorrect.  Actual total is £42")
        end

        it 'checks that if total entered twice the total doesnt change' do
          subject.select(:Hamburger=>3, :Pizza=>2, :Salad=>5)
          expect{ subject.my_total(41)}.to raise_error("Total entered (£41) is incorrect.  Actual total is £42")
          expect{ subject.my_total(41)}.to raise_error("Total entered (£41) is incorrect.  Actual total is £42")
        end

        it 'check that if total entered is incorrect an error is given' do
          subject.select(:Hamburger=>3, :Pizza=>2, :Salad=>5)
          expect{ subject.my_total(42)}.to output("Amount given is correct.  Food ordered\n").to_stdout
        end
    end

    describe '#print_my_dishes' do
      it 'expects order to print out with quantities' do
        subject.select(:Hamburger=>3, :Pizza=>2, :Salad=>5)
        expect{subject.print_my_dishes}.to output("Hamburger (£5) x 3 = £15\nPizza (£6) x 2 = £12\nSalad (£3) x 5 = £15\n").to_stdout
      end
    end

end
