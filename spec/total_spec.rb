require 'total'

describe Total do

  describe '#calculate_total' do
    before do
      @current_order = [{ 1 => { dish: 'Whole Chicken', price: 11.50 } }]
    end

    it 'returns the total' do
      p @subtotal
      subject.calculate_total
      expect(@total).to eq 11.50
    end

  end

end
