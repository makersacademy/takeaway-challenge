require 'takeaway'

describe Takeaway do
  let(:dish) {"margherita"}
  let(:dish2) {"garlic bread"}
  let(:price) {4.50}
  let(:menu) {double(:menu, dishes: dish, price: price)}
  subject(:takeaway) {described_class.new(menu)}

  context 'reading a menu' do
    it 'can access the menu' do
      expect(takeaway.menu).to eq menu.dishes
    end
  end

  context 'ordering' do
    it 'can take an order' do
      expect(takeaway).to respond_to :order
    end

    it 'starts with an empty basket' do
      expect(takeaway.basket).to eq({})
    end

    it 'can remember an order' do
      takeaway.order(dish)
      expect(takeaway.basket).to eq ({"#{dish} x1"  => price})
    end

    it 'can remember an order of more than one of a dish' do
      takeaway.order(dish, 3)
      expect(takeaway.basket).to eq ({"#{dish} x3"  => price*3})
    end

    it 'can remember more than one order' do
      takeaway.order(dish)
      takeaway.order(dish2, 2)
      basket = ({"#{dish} x1"  => price, "#{dish2} x2" => price *  2})
      expect(takeaway.basket).to eq basket
    end

    it 'tells you what you have just ordered' do
      message = "You have just ordered 1x #{dish}!"
      expect(takeaway.order(dish)).to eq message
    end
  end

  context 'pricing' do
    before do
      takeaway.order(dish)
      takeaway.order(dish2, 2)
    end

    it 'can return total cost' do
      expect(takeaway.total).to eq "Total: £#{13.5}0"
    end

    it 'can check sum of basket = total' do
      expect(takeaway.check_total).to eq true
    end

  end

  context 'texting' do
    before do
      allow(takeaway).to receive(:send_text)
      takeaway.order(dish)
    end

    it 'won\'t send text if total is wrong' do
      allow(takeaway).to receive(:check_total).and_return(false)
      expect {takeaway.complete_order}.to raise_error "This order was not completed"
    end

    it 'texts confirmation message' do
      message = "Thank you for your order of £4.50."
      message << " Your food will be delivered within an hour."
      expect(takeaway).to receive(:send_text).with(message)
      takeaway.complete_order
    end
  end

  context 'complete order' do
    before do
      allow(takeaway).to receive(:send_text)
      takeaway.order(dish)
    end

    it 'resets basket when order completed' do
      takeaway.complete_order
      expect(takeaway.basket).to eq ({})
    end

    it 'resets total when order completed' do
      takeaway.complete_order
      expect(takeaway.total).to eq ("Total: £0.00")
    end
  end
 end