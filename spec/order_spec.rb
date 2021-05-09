require 'order'

describe Order do
  
  describe '#menu' do
  
    it 'prints the list of dishes from the menu' do 
      bhaji_double = double :bhaji, name: "Bhajis", price: 4
      rice_double = double :rice, name: "Rice", price: 2
      korma_double = double :korma, name: "Korma", price: 8
      jalfrezi_double = double :jalfrezi, name: "Jalfrezi", price: 10
      naan_double = double :naan, name: "Naan", price: 4
      chai_double = double :chai, name: "Chai", price: 2
      order = Order.new(bhaji_double, rice_double, korma_double, jalfrezi_double, naan_double, chai_double)
      expect(order.menu).to eq("Bhajis £4,\ Rice £2,\ Korma £8,\ Jalfrezi £10,\ Naan £4,\ Chai £2")
    end
  end

  describe '#select food' do
    it 'creates an array with of your selected food' do
      order = Order.new
      order.select_food("chai")
      expect(order.order).to eq(["chai"])
    end
  end

  describe '#total' do
  it 'returns the total of the order' do
      order = Order.new 
      order.select_food("chai")
      expect(order.total).to eq(2)
    end
  end



end
