require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, dishes: [{ "Margherita" => 7.5 },
                                      { "Bufala" => 8 },
                                      { "Anchovy" => 8 },
                                      { "Pepperoni" => 8.5 },
                                      { "Calabria" => 8.5 },
                                      { "Quattro Formaggi" => 10 },
                                      { "Truffle" => 12.5 },
                                      { "Gold Pizza" => 1200 }
  ])
  }
  let(:menu_class) { double(:menu_class, new: menu) }
  let(:text) { double(:text, send: nil) }
  let(:text_class) { double(:text_class, new: text) }
  let(:subject) { Takeaway.new(menu_class, text_class) }

  describe "#list_dishes" do
    it 'should be able to list dishes from a menu' do
      expect(menu).to receive(:list_dishes)
      subject.list_dishes
    end
  end

  describe "#add_dish" do
    it 'should add a specified item to the basket' do
      basket = [{ name: "Margherita", quantity: 1, cost: 7.5 }]
      subject.add_dish("Margherita", 1)
      expect(subject.basket).to eq basket
    end

    it 'should be able to add multiple quantities of an item' do
      basket = [{ name: "Quattro Formaggi", quantity: 5, cost: 50.0}]
      subject.add_dish("Quattro Formaggi", 5)
      expect(subject.basket).to eq basket
    end

    it 'should raise error if the specified dish is not on the menu' do
      message = "Cannot find the specified dish!"
      expect { subject.add_dish("Snail pizza", 120) }.to raise_error message
    end
  end

  describe "#place_order" do
    before do
      subject.add_dish("Margherita", 1)
      subject.add_dish("Pepperoni", 3)
    end

    it 'should raise error if the given total is incorrect' do
      message = "Incorrect total given!"
      expect { subject.place_order(123) }.to raise_error message
    end

    it 'should send a text if the given total is correct' do
      expect(text).to receive(:send)
      subject.place_order(33)
    end

    it 'should confirm the order if the given total is correct' do
      message = "Order placed! Look out for a confirmation text."
      expect(subject.place_order(33)).to eq message
    end
  end
end
