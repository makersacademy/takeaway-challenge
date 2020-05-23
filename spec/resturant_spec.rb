require 'resturant'

describe Resturant do
  subject { Resturant.new(menu) }

  let(:dishes) { [:chicken, :beef, :pasta, :pizza, :burger] }
  let(:menu) { double(:menu, show_menu: "chicken\nbeef\npasta\npizza\nburger\n") }

  context 'ordering' do

    before do
      subject.start_order
    end

    it 'should start and order' do
      expect(subject.order).to eq([])
    end

    it 'should cancel and order' do
      subject.cancel_order
      expect(subject.order).to be_nil
    end

    it 'should add dishes to order with quantity' do
      subject.add_to_order(:chicken, 2)
      expect(subject.order).to include({dish: :chicken, amount: 2})
    end

    it 'will not let you add to order if order not started' do
      subject.cancel_order
      expect { subject.add_to_order(:chicken, 2)}.to raise_error("order not started")
    end

    it 'will just update quantity when adding a dish already in order' do
      2.times { subject.add_to_order(:chicken, 1) }
      expect(subject.order).to eq([{dish: :chicken, amount: 2}])
    end

    it 'will remove an order' do
      subject.add_to_order(:chicken, 1)
      subject.remove(:chicken)
      expect(subject.order).to be_empty
    end

    it 'will just update quantity if remove quantity is less than order total' do
      2.times { subject.add_to_order(:chicken, 1) }
      subject.remove(:chicken)
      expect(subject.order).to include({dish: :chicken, amount: 1})
    end

    it 'will error if you try to remove dish not in order' do
      expect { subject.remove(:beef) }.to raise_error("beef not in order")
    end


  end

end
