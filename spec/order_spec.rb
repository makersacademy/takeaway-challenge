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
      subject.add("bread", 2)
      expect(subject.basket_summary).to include({"pasta" => 3}, {"bread" => 2})
    end
  
    # it 'can add price of items to total' do
    #   subject.add(pasta)
    #   expect{subject.add(pasta)}.to change{subject.total}.by(4.99)
    # end

    # it 'can display total' do
    #   expect
    # end

  end