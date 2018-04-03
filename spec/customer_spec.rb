require 'customer'

describe Customer do
  ERROR_MESSAGES = {
    not_enough_money_for_order: 'Sorry, you do not have enough money to pay for order'
  }.freeze

  it { expect(subject).to respond_to(:place_an_order).with(1).argument }

  let(:customer) { Customer.new(true, 100) }

  context 'when placing an order' do
    let(:restaurant) { double :restaurant }
    let(:order) { double :order }
    before {
      allow(restaurant).to receive(:show_menu)
      allow(restaurant).to receive(:take_an_order)
    }
    context 'when user is hungry' do
      context 'when restauran takes an order' do
        before {
          allow(order).to receive(:total_price).and_return(20)
          allow(restaurant).to receive(:take_an_order).and_return(order)
        }
        context 'when user has enough money' do
          it 'deducts money from bank account' do
            allow(restaurant).to receive(:receive_money)
            customer.place_an_order(restaurant)
            expect(customer.bank_account).to eq(80)
          end
          it 'transfers money to restaurant bank account' do
            expect(restaurant).to receive(:receive_money).with(20, customer)
            customer.place_an_order(restaurant)
          end
        end
        context 'when user does not have enough money' do
          let(:customer) { Customer.new(true, 10) }
          it 'raises an error' do
            expect { customer.place_an_order(restaurant) }.to raise_error(ERROR_MESSAGES[:not_enough_money_for_order])
          end
        end
      end

      context 'when restaurant does not take an order' do
        before {
          allow(restaurant).to receive(:take_an_order).and_return(nil)
        }
        context 'when user has enough money' do
          it 'does not deduct money from bank account' do
            allow(restaurant).to receive(:receive_money)
            customer.place_an_order(restaurant)
            expect(customer.bank_account).to eq(100)
          end
          it 'does not transfers money to restaurant bank account' do
            expect(restaurant).to_not receive(:receive_money).with(20, customer)
            customer.place_an_order(restaurant)
          end
        end
      end
    end
    context 'when user is not hungry' do
      before {
        customer.hungry = false
      }
      it 'does not place an order' do
        expect(restaurant).to_not receive(:take_an_order)
        customer.place_an_order(restaurant)
      end
    end
  end
end
