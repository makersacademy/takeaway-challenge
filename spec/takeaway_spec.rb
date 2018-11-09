require 'takeaway'

describe Takeaway do
  let(:basket) { double("basket")}
  let(:order) { double("order") }
  subject(:takeaway) { Takeaway.new(basket,order)}

  it 'responds to .see_dishes' do
    expect(takeaway).to respond_to(:see_dishes)
  end

  it 'shows a list of dishes with prices' do
    takeaway.dishes = [{ name: "Pizza", price: 20 }]
    expect { takeaway.see_dishes.length }.to output("Name: Pizza |||| Price: £20\n").to_stdout
  end
  
  it 'responds to .select_dish' do
    expect(takeaway).to respond_to(:select_dish)
  end

  context 'select pizza as only item' do

    # before(:each) do
      
    # end

    it 'adds selected dishes to basket' do
      dish = { name: "Pizza", price: 20}
      quantity = 2
      expect(takeaway).to receive(:gets).and_return("Pizza")
      expect(takeaway).to receive(:gets).and_return(quantity)
      expect(takeaway).to receive(:gets).and_return("exit")
      expect(basket).to receive(:add).and_return(true)
      expect(basket).to receive(:total).and_return(20)
      expect(basket).to receive(:view).and_return([{ name: "Pizza", price: 20}])
      takeaway.select_dish
      expect(takeaway.basket.view.pop).to eq dish
    end

    # it 'basket contains array of selected dishes' do
    #   allow(basket).to respond_to(:items)
    #   expect(takeaway.basket.items[0].has_value?("Pizza")).to eq true
    # end

    # it 'returns a total cost of twenty' do
    #   expect(takeaway.total).to eq 20
    # end

    context 'place order' do

      it 'should respond to place_order' do
        expect(takeaway).to respond_to(:place_order)
      end
    end
  end

end
