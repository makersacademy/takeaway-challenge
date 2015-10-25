require 'takeaway'
require 'twilio'
require 'support/shared_examples_for_twilio'

describe Takeaway do

  let(:takeaway) {described_class.new}
  let(:dish_klass) {double(new: dish, price: 4)}
  let(:class_double) {double}
  let(:dish) {double(class: class_double)}

  context 'The menu' do
    let(:menu_file) {double(each_line: nil)}

    describe '#menu' do
      it 'displays the list of dishes' do
        allow(File).to receive(:read).and_return(menu_file)
        expect(File).to receive(:read)
        takeaway.menu
      end
    end
  end

  context 'Ordering dishes' do
    describe '#take_order' do
      it 'raises an error when user\'s cost total doesn\'t match the real total' do
        expect{takeaway.take_order(dish_klass.price + 1, dish_klass)}.to raise_error 'The total provided does not match the sum of the prices of the dishes selected'
      end
    end

    describe '#review_order' do
      it 'returns the dishes currently ordered, with their quantities and the total price' do
        takeaway.take_order(dish_klass.price,dish_klass)
        expect(takeaway.review_order).to eq ("Your current order is: #{{class_double => 1}}. The total cost is £#{'%.2f' %dish_klass.price}.")
      end

      it 'raises an error if the ordered_dishes array is empty' do
        expect{takeaway.review_order}.to raise_error 'No dishes have been ordered'
      end
    end

    describe '#remove_order' do
      before(:each) do
        takeaway.take_order(dish_klass.price,dish_klass)
        takeaway.remove_order
      end

      it 'empties the ordered_dishes hash' do
        expect{takeaway.review_order}.to raise_error 'No dishes have been ordered'
      end

      it 'makes the running total zero' do
        expect(takeaway.subtotal).to eq '0.00'
      end

      it 'raises an error if the dish array is already empty' do
        expect{takeaway.remove_order}.to raise_error 'You have not selected any dishes'
      end
    end

    describe '#subtotal' do
      it 'returns the running total' do
        takeaway.take_order(dish_klass.price,dish_klass)
        expect(takeaway.subtotal).to eq "#{'%.2f' %dish_klass.price}"
      end
    end

    describe '#submit_order' do
      it 'raises an error if the dish array is empty' do
        expect{takeaway.submit_order}.to raise_error 'You have not selected any dishes'
      end
    end
  end

  context 'Twilio' do
    describe 'Twilio module' do
      it_behaves_like Twilio
    end
  end

end
