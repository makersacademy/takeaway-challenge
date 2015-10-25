require 'customer'

describe Customer do

subject(:customer) { described_class.new(takeaway_klass) }
let(:customer_klass) { double(new: customer, view_menu: takeaway.menu)}
let(:takeaway_klass) { double(new: takeaway) }
let(:takeaway) { double(menu: {chips: 4.00, rice: 2.00 }) }

    describe '#view_menu' do
      it 'shows a customer a menu from a specified takeaway' do
        expect(customer_klass.view_menu(takeaway)).to eq(takeaway.menu)
      end
    end

    describe '#initialize' do
      it 'lets a customer select a takeaway' do
        expect(customer.takeaway).to eq(takeaway)
      end
    end

    describe '#select_dish' do
      it 'adds dishes to the customer\'s basket' do
        customer.select_dish(:chips, 2)
        expect(customer.basket).to eq({chips: 2})
      end

      it 'raises an error if the selected dish does not exist' do
        error = 'Please select a dish from the menu'
        expect{customer.select_dish(:invalid_dish, 1)}.to raise_error error
      end
    end

    describe '#order_total' do
      it 'provides the customer with the total of all individual items in their basket' do
        customer.select_dish(:chips, 2)
        customer.select_dish(:rice, 2)
        expect(customer.order_total).to eq(12.00)
      end
    end

    describe '#place_order' do
      it 'raises an error if the basket is empty' do
        error = 'Your basket is empty. Please select a dish'
        expect{customer.place_order}.to raise_error error
      end

      it 'places a customer\'s order with the takeaway' do
        confirmation_message = 'Thank you! Your order was placed and will be delivered before 19:00'
        customer.select_dish(:chips, 2)
        allow(takeaway).to receive(:complete_order).and_return(confirmation_message)
        expect(customer.place_order).to eq(confirmation_message)
      end
    end

end
