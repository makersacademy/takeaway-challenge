require 'order'

  describe Order do

    subject(:order) { described_class.new(menu) }
    let(:menu) { double :menu, valid_item: item, price: 10 }
    let(:item) { double :item }

      it 'lets a user see the menu' do
        expect(order.show_menu).to eq menu
      end

      describe '#add_to_basket' do

        it 'adds items to the basket' do
          order.add_to_basket(item, 1)
          expect(order.basket).to include item
        end
      end

      describe '#review_order' do

        before do
          $stdout = StringIO.new
        end

        after(:all) do
          $stdout = STDOUT
        end

        it 'prints out the final order and total' do
          order.add_to_basket('pasta', 1)
          order.review_order
          expect($stdout.string).to match("1 x pasta: £10")
          end
        end

      describe '#checkout' do

        let(:text) { double :text , send_msg: "Message sent"}

          it 'raises error if payment does not match total' do
            order.add_to_basket('pasta', 1)
            message = 'Please enter correct amount'
            expect{order.checkout(1, text)}.to raise_error message
          end

      end

  end
