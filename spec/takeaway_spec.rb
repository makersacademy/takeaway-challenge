require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu }
  let(:phone) { double :Text.new(phone_number) }

  context 'initialize' do
    subject { described_class.new(menu) }
    it 'initializes with a menu' do
      expect(subject.menu).to eq(menu)
    end
  end

  context 'adding items to order' do
    before do
      meal = TakeAway.new
      meal.order('green curry')

      it 'lets the user to select dishes to add to order' do
        expect(meal.basket).to eq(["green curry"])
      end

      it 'lets the user check the total order' do
        expect(meal.view_order).to eq("Your order total so far is: £3.00")
      end
    end
  end

  it 'the order starts at £0' do
    expect(subject.check_total).to eq(0)
  end

  it 'sends a text message' do
    expect(subject).to respond_to(:complete_order)
  end

end
