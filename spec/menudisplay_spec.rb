require './lib/menudisplay'
describe MenuDisplay do
  let(:dish_class) { double :dish_class, new: dish }
  let(:dish)       { double :dish, name: :Durain, price: 440 }
  let(:menu_class) { double :menu_class, new: menu }
  let(:menu)       { double :menu }
  let(:oder_class) { double :order_class, new: order }
  let(:order)      { double :order, dish_list: [dish, dish] }
  let(:subject)    { described_class.new(dish_class, menu, order) }
  context 'Feature 1 - List of Items with prices' do
    before(:each) { allow(menu).to receive(:dish_list) { [dish, dish] } }
    describe '#print_menu' do
      it { expect(subject).to respond_to(:print_menu) }
      it 'prints one item menu correctly' do
        expect { subject.print_menu }.to output("1: Durain - 4.40\n"\
                                                "2: Durain - 4.40\n").to_stdout
      end
    end
  end
  context 'Feature 2 - shopping basket' do
    describe '#print basket' do
      it { expect(subject).to respond_to(:print_basket) }
      it { expect { subject.print_basket }.to output("1: Durain - 4.40\n"\
                                                     "2: Durain - 4.40\n").to_stdout 
      }
    end
  end
  context 'Feature 3 - running total' do
    before(:each) { allow(order).to receive(:total_cost) { 2 * dish.price } }
    describe '#print_total' do
      it { expect(subject).to respond_to(:print_total) }
      it { expect { subject.print_total }.to output("Total: 8.80\n").to_stdout }
    end
  end
  context 'Deature 4 - print interface' do
    before(:each) { allow(menu).to receive(:dish_list) { [dish, dish] } }
    before(:each) { allow(order).to receive(:total_cost) { 2 * dish.price } }
    let(:interface) { ["---------------- Jack's Bistro ---------------",
                       "1: Durain - 4.40", "2: Durain - 4.40",
                       "---------------------Basket-------------------",
                       "1: Durain - 4.40", "2: Durain - 4.40", "Total: 8.80\n"].join("\n") 
    }
    describe '#print_interface' do
      it { expect(subject).to respond_to(:print_interface) }
      it { expect { subject.print_interface }.to output(interface).to_stdout }
    end
  end
end
