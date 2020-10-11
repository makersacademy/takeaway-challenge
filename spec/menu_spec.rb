require 'Menu.rb'
require 'BillCalculator.rb'

describe Menu do
  let(:dish) { double :dish }
  let(:price) { double :price }
    describe '#meal_options'
      it 'returns menu' do
        expect(subject.meal_options).to eq([
          {"Hamburger"=>5},
          {"Pizza"=>6},
          {"Pasta"=>4},
          {"Fish and chips"=>5},
          {"Salad"=>3},
          {"Lamb shank"=>7}])
        end

  describe '#select' do
    it 'check method stores selection to #dishes variable' do
      subject.select(dish=>price, dish=>price)
        expect(subject.dishes).to eq(dish=>price, dish=>price)
    end
  end

  describe '#print_all' do
    let(:printed_dishes){ {Dish: dish, price: price} }
      it 'prints all dishes using the Print class' do
        expect(subject.print_all(printed_dishes)).to include printed_dishes
      end
  end

  describe '#total_entered' do
    let(:total) {double :total}
    let(:actual_total) {double :actual_total}
    it 'updates customer total' do
      expect(subject.total_entered(total)).to eq(subject.customer_total)
    end

    it 'check that if total entered is incorrect an error is given' do
      subject.total_entered(total)
      expect{ subject.total_error(actual_total)}.to raise_error("Total entered (£#{total}) is incorrect.  Actual total is £#{actual_total}")
    end


  end

  describe '#print_selected'
    it 'expects order to print out with quantities' do
      subject.select("Hamburger"=>3, "Pizza"=>2, "Salad"=>5)
      subject.store_order
        expect{subject.print_dishes}.to output("Hamburger (£5) x 3 = £15\nPizza (£6) x 2 = £12\nSalad (£3) x 5 = £15\n").to_stdout
    end




end
