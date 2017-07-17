require 'order'

describe Order do

  let(:menu1)  {double :menu1}
  let(:order_1) {described_class.new( menu1, [ { "Pie n Mash" => 1, "Bangers n Mash" => 2 }, 19.75 ] ) }
  let(:order_2) {described_class.new( menu1, [ { "Pie n Mash" => 1, "Bangers n Mash" => 2 }, 19.00 ] ) }

  it "stores amount of dishes" do
    expect(order_1.dish).to eq( { "Pie n Mash" => 1, "Bangers n Mash" => 2 } )
  end

  it "stores the customers total payment" do
    expect(order_1.payment).to eq 19.75
  end

    context "correct payment" do
      before do

        allow(order_1).to receive(:menu).and_return({ "Pie n Mash" => 5.25, "Bangers n Mash" => 7.25 })
        expect(order_1.calculate_total).to eq 19.75
      end

        it "calculates a total" do #fails
          expect(order_1.calculate_total).to eq 19.75
        end

        it 'sends a message if order is successful' do #fails
          order1.check_payment
          expect(order1.send_message).to eq "Thank you for your order!"
        end

      end

      context "Incorrect payment" do
        before do

          allow(order_2).to receive(:menu).and_return({ "Pie n Mash" => 5.25, "Bangers n Mash" => 7.25 })
        end

          it "raises and error" do
            expect{order_2.check_payment}.to raise_error("Incorrect payment amount")
          end

        end



end
