require 'order'

describe Order do

  let(:dish) { {name: 'Bolognese', price: 6} }

  describe 'initialize'
    it { should respond_to :list }
    it { should respond_to :total }

  describe '#add'
    it 'should add dish and amount to list' do
      subject.add(dish,1)
      expect(subject.list).to eq [{name: dish[:name], price: dish[:price], amount: 1}]
    end

    it 'should increase amount if dish already on the list and added again' do
      subject.add(dish,1)
      subject.add(dish,1)
      expect(subject.list).to eq [{name: dish[:name], price: dish[:price], amount: 2}]
    end

  describe '#total'
    it 'adds total correctly' do
      subject.add(dish,1)
      subject.add(dish,1)
      expect(subject.total).to eq 12
    end

end
