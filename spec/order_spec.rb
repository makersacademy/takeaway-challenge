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

  describe '#select_food' do 
    it "should return Naan" do
      order = Order.new
      order.select_food
      expect(@order).to eq("Naan")
    end
=begin
    it 'should tell you to try again if user input is empty' do
      let (:user_input) { "dshbfdjhsb" }
      order = Order.new
      order.select_food
      expect(@order).to eq([])
    end
=end
  end 
  # in order to be able to select dishes we need the menu to be printed, then user input which loops 
  # asking for dishes, which ocnsequently pushes the chosen dish into an array. the result
  # is an array of dishes 
  # it 'selects multiple dishes to create a new order' do 
    # order = order.new
  #  order.select_food
   # expect(order).to eq(dummy_order)

end
