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
  let(:basket) { double(:basket, items: []) }
  let(:basket_class) { double(:basket_class, new: basket) }
  let(:subject) { Takeaway.new(menu_class, text_class, basket_class) }

  describe "#list_dishes" do
    it 'should be able to list dishes from a menu' do
      expect(menu).to receive(:list_dishes)
      subject.list_dishes
    end
  end

  describe "#add_dish" do
    it 'should add dish to the basket' do
      expect(basket).to receive(:add_dish).with("Margherita", 2)
      subject.add_dish("Margherita", 2)
    end

    it 'should display a confirmation message when an item is added' do
      message = "Gold Pizza x 2 added to the basket."
      allow(basket).to receive(:add_dish).with("Gold Pizza", 2)
      expect(subject.add_dish("Gold Pizza", 2)).to eq message
    end
  end

  describe "#place_order" do
    before { allow(basket).to receive(:total).and_return(33) }

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
