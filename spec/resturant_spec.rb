require 'resturant'

describe Resturant do
  subject { Resturant.new }

  let(:dishes) { [:chicken, :beef, :pasta, :pizza, :burger] }

  context 'menu' do

    it 'starts with an array of dishes' do
      expect(subject.dishes).to eq(dishes)
    end

    it 'prints menu, line by line, when you call show_menu' do
      expect { subject.show_menu }.to output("chicken\nbeef\npasta\npizza\nburger\n").to_stdout
    end

  end

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

  end

end
