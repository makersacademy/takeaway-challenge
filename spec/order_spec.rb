require 'order'

describe Order do
  let(:chips_and_rice) { double(:dish, name: "Chips and Rice", price: 2.99) }
  let(:yuk_sung) { double(:dish, name: "Yuk Sung", price: 3.99) }
  let(:seaweed) { double(:dish, name: "Seaweed", price: 2.99) }
  let(:menu) { double(:menu, dishes: [chips_and_rice, yuk_sung], has_dish?: true) }
  let(:takeaway) { double(:takeaway) }
  subject { Order.new(menu) }

  describe '#new' do
    context 'when initialized' do
      it 'has a menu' do
        expect(subject.menu).to eq menu
      end
    end
  end

  describe '#add' do
    context 'when dish is available' do
      it 'add to the order' do
        expect { subject.add(menu.dishes[0]) }.to change { subject.bill.count }.by(1)
        expect(subject.bill).to include menu.dishes[0]
      end
    end

    context 'when dish isn\'t available' do
      it 'an error is raised' do
        allow(menu).to receive(:has_dish?).and_return(false)
        err = described_class::NOT_AVAILABLE_ERROR
        expect { subject.add(seaweed) }.to raise_error(RuntimeError, err)
      end
    end
  end

  describe '#total' do
    context 'when all dishes are added to the order' do
      it 'a total is calculated' do
        subject.add(chips_and_rice)
        subject.add(yuk_sung)
        expect(subject.total).to eq (chips_and_rice.price + yuk_sung.price)
      end
    end
  end

  describe '#finalise' do
    context 'takeaway is informed of order' do
      it 'sends instruction to Takeaway' do
        expect(takeaway).to receive(:complete)
        subject.finalise(takeaway)
      end
    end
  end
end
