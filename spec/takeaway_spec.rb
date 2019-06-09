require 'takeaway'

RSpec.describe Takeaway do
  let(:subject) { described_class.new }

  describe '#show_menu' do

    it 'return a list of dishes' do
      expect(subject.show_menu).to eq Takeaway::MENU
    end
  end

  describe '#select' do

    it 'returns a list of selected dishes and their number' do
      allow(subject).to receive(:selected_dishes).and_return({ :olives => 2, :pizza => 1 })
      expect(subject.selected_dishes).to eq({ :olives => 2, :pizza => 1 }) 
    end 
  end 

  describe '#bills' do

    it 'returns the bills' do
      quantity = 5
      dish = :olives
      expect(subject.bills(dish, quantity)).to eq(20.0)
    end
  end

  describe '#total' do

    it 'returns the total' do
      quantity = 5
      dish = :olives
      subject.bills(dish, quantity)
      expect(subject.total).to eq(20.0)
    end
  end

  describe '#check_total' do

    it 'return true if user input match the total' do
      quantity = 5
      dish = :olives
      subject.bills(dish, quantity)
      allow($stdin).to receive(:gets).and_return(20.0)
      total = $stdin.gets
      expect(subject.check_total(total)).to eq(true)
    end

    it 'raise an error if the user input the wrong total' do
      quantity = 5
      dish = :olives
      subject.bills(dish, quantity)
      allow($stdin).to receive(:gets).and_return(10.0)
      total = $stdin.gets
      expect { subject.check_total(total) }.to raise_error
    end
  end

end
