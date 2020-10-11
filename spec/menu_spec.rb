require 'Menu.rb'
require 'BillCalculator.rb'

describe Menu do
  let(:dish) { double :dish }
  let(:price) { double :price }

  describe '#select' do
    it 'check method stores selection to #dishes variable' do
      subject.select(dish=>price, dish=>price)
        expect(subject.dishes).to eq(dish=>price, dish=>price)
    end
  end

  describe '#print_all' do
      it 'prints all dishes using the Print class' do
        expect{subject.print_all}.to output("Dish: Hamburger, Price: £5\nDish: Pizza, Price: £6\nDish: Pasta, Price: £4\nDish: Fish_and_chips, Price: £5\nDish: Salad, Price: £3\nDish: Lamb_Shank, Price: £7\n").to_stdout
      end
  end

  describe '#total_entered' do
    let(:total) {double :total}
    let(:actual_total) {double :actual_total}
    it 'updates customer total' do
      expect(subject.total_entered(total)).to eq(subject.customer_total)
    end

    it 'check that if total entered is incorrect an error is given' do
      subject.select(:Hamburger=>3, :Pizza=>2, :Salad=>5)
      subject.total_entered(41)
      expect{ subject.total_error}.to raise_error("Total entered (£41) is incorrect.  Actual total is £42")
    end
  end

  describe '#print_selected'
    it 'expects order to print out with quantities' do
      subject.select(:Hamburger=>3, :Pizza=>2, :Salad=>5)
      subject.store_order
      expect{subject.print_dishes}.to output("Hamburger (£5) x 3 = £15\nPizza (£6) x 2 = £12\nSalad (£3) x 5 = £15\n").to_stdout
    end




end
