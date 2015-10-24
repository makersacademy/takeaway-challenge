require 'takeaway'

describe Takeaway do

  let(:takeaway) {described_class.new}
  let(:dish_klass) {double(new: dish, price: 4)}
  let(:dish) {double}
  # allow(takeaway).to receive (:total) {5}

  context 'The menu' do
    let(:menu_file) {double(:each_line=> nil)}

    describe '#menu' do
      it 'displays the list of dishes' do
        allow(File).to receive(:read).and_return(menu_file)
        expect(File).to receive(:read)
        takeaway.menu
      end
    end
  end

  context 'Ordering dishes' do
    describe '#order' do
      it 'raises an error when user\'s cost total doesn\'t match the real total' do
        expect{takeaway.order(dish_klass.price+1, [dish_klass])}.to raise_error 'the total provided does not match the sum of the prices of the dishes selected'
      end

    describe '#klass_iterator' do
      it 'creates an array of dish instances' do
        expect(takeaway.klass_iterator([dish_klass])).to eq [dish]
      end
    end

    end
  end

end
