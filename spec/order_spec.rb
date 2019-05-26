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

    it 'can display total' do
      subject.add("pizza")
      subject.price_calc
      expect(subject.display_total).to eq("Your order total is currently £5.99")
    end

  end