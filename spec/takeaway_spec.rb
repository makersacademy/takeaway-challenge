require 'takeaway'

describe Takeaway do
  let(:basket) { double("basket")}
  let(:order) { double("order") }
  subject(:takeaway) { Takeaway.new(basket,order)}

  it 'shows a list of dishes with prices' do
    takeaway.dishes = [{ name: "Pizza", price: 20 }]
    expect { takeaway.see_dishes.length }.to output("Name: Pizza |||| Price: £20\n").to_stdout
  end

  context 'select pizza as only item' do

    it 'adds selected dishes to basket' do
      dish = { name: "Pizza", price: 20}
      quantity = 2
      expect(takeaway).to receive(:gets).and_return("Pizza")
      expect(takeaway).to receive(:gets).and_return(quantity)
      expect(takeaway).to receive(:gets).and_return("exit")
      expect(basket).to receive(:add).and_return(true)
      takeaway.select_dish
    end

    it 'should respond to place_order' do
      expect(takeaway).to respond_to(:place_order)
    end

  end

end
