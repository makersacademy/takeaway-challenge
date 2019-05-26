require 'order'

  describe Order do
    subject         { Order.new }
    # let(:pasta)     { double(:pasta)}
  
    it 'basket summary is empty by default' do
      expect(subject.basket_summary).to eq({})
    end

    it 'can add an item to basket' do
      subject.add("pasta")
      expect(subject.basket_summary).to include({"pasta" => 1})
    end
  
    it 'can add multiple items to basket' do
      subject.add("pasta", 3)
      subject.add("bread", 5)
      subject.add("pasta", 1)
      expect(subject.basket_summary).to include({"pasta" => 4}, {"bread" => 5})
    end
  
    # OUTSTANDING - CALCULATE A PRICE PER DISH AND ADD TO A TOTAL COST
    it 'can add item price to total cost' do
      subject.add("pizza")
      expect{subject.price_calc}.to change{subject.total}.by(5.99)
    end

    # DISPLAY A TOTAL COST (just an integer) WHEN USER CALLS TOTAL
    # it 'can display total' do
    #   expect
    # end

  end