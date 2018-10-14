require 'order'
require 'menu'

describe Order do

  context 'when added' do

    it 'should add items added from menu to the order' do
      subject.add({ "1 Spaghetti Bolognese" => 9 })
      expect(subject.order).to eq ["1 Spaghetti Bolognese" => 9]
    end

  end

  context 'when deleted' do

    it 'should delete items added from menu to the order' do
      subject.add({ "1 Spaghetti Bolognese" => 9 })
      subject.add({ "2 Pasta Puttanesca" => 9 })
      expect(subject.delete(1)).to eq [{ "2 Pasta Puttanesca" => 9 }]
    end

  end

  context 'when totalled' do

    it 'should show the total in the order after adding' do
      subject.add({ "1 Spaghetti Bolognese" => 9 })
      subject.add({ "1 Spaghetti Bolognese" => 9 })
      subject.sum_total
      expect(subject.total).to eq 18
    end

    it 'should show the total in the order after deleting' do
      subject.add({ "1 Spaghetti Bolognese" => 9 })
      subject.add({ "2 Pasta Puttanesca" => 9 })
      subject.delete(1)
      subject.sum_total
      expect(subject.total).to eq 9
    end

  end

end
