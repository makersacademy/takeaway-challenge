require './lib/menudisplay'
describe MenuDisplay do
  let(:dish_class) { double :dish_class, new: dish }
  let(:dish)       { double :dish, name: :Durain, price: 440 }
  let(:menu_class) { double :menu_class, new: menu }
  let(:menu)       { double :menu }
  let(:oder_class) { double :order_class, new: order }
  let(:order)      { double :order }
  let(:subject)    { described_class.new(dish_class, menu, order) }
  context 'Feature 1 - List of Items with prices' do
    describe '#print_menu' do
      before(:each) { allow(menu).to receive(:dish_list) { [dish, dish] } }
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
      it { expect(subject.print_basket).to eq("1: Durain - 440\n"\
                                              "2: Tomacco - 2550\n") }
    end
  end
  context 'Feature 3 - running total' do
    describe '#print_total'do
      it { expect(subject).to respond_to(:print_total) }
    end
  end
  context 'Deature 4 - print interface' do
    describe '#print_interface' do

    end
  end
end
