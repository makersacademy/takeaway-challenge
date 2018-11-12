require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(basket_class,order_class)}
  let(:basket_class) { double("basket_class", :new => basket)}
  let(:order_class) { double("order_class", :new => order)}
  let(:basket) { double("basket", :add => true)}
  let(:order) { double("order") }

  it 'shows a list of dishes with prices' do
    takeaway.dishes = [{ name: "Pizza", price: 20 }]
    expect { takeaway.see_dishes }.to output("Name: Pizza |||| Price: £20\n").to_stdout
  end

  context 'select pizza as only item' do

    it 'adds selected dishes to basket' do
      dish = { name: "Pizza", price: 20}
      quantity = 2
      expect(takeaway).to receive(:gets).and_return("Pizza")
      expect(takeaway).to receive(:gets).and_return(quantity)
      expect(takeaway).to receive(:gets).and_return("exit")
      
      takeaway.select_dish
      # expect {takeaway.select_dish}.to output("What dish would you like? (type exit to complete selection)").to_stdout
    end

    it 'should respond to place_order' do
      expect(takeaway).to respond_to(:place_order)
    end

    it 'can place order' do
      expect(order).to receive(:process).with(basket)
      takeaway.place_order
    end

  end

end
