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
  
    it 'can add item price to total cost' do
      subject.add("pizza")
      expect{subject.price_calc}.to change{subject.total}.by(5.99)
    end

    it 'can add multiple items to total cost' do
      subject.add("pizza",10)
      subject.add("bread",3)
      subject.add("pasta",4)
      expect{subject.price_calc}.to change{subject.total}.by(82.83000000000001) 
    end
    #Outstanding: find out how to format floats to 2 decimal points throughout code base.

    it 'can display total cost of order' do
      subject.add("pizza")
      subject.price_calc
      expect(subject.display_total).to eq("Your order total is £5.99")
    end

  end