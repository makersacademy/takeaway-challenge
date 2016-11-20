require 'order'

describe Order do
  let(:dishlist) { [{:dish=>:v, :price=>4},
                      {:dish=>:v, :price=>3}] }
  subject(:order) { described_class.new(dishlist) }

  context "initialization" do
    it "has an empty array of ordered dishes at initialization" do
      expect(order.ordered_dishes).to eq []
    end

    it "initializes with total equaling to 0" do
      expect(order.total).to eq 0
    end
  end

  context "User chooses dish number" do
    before do
      $stdin = StringIO.new("1")
    end

    after do
      $stdin = STDIN
    end

    it "Asks for a dish number" do
      message = "Please choose index number of the dish you would like to order.\n"
      expect {order.which_dish}.to output(message).to_stdout
    end

    it "Lets user enter a dish number" do
      expect(order.which_dish).to eq 1
    end
  end

  context "User chooses number of portions" do
    before do
      $stdin = StringIO.new("2")
    end

    after do
      $stdin = STDIN
    end

    it "Asks for a number of portions" do
      message = "How many portions of this dish would you like to order?\n"
      expect {order.how_many}.to output(message).to_stdout
    end

    it "Lets uder enter number of portions" do
      expect(order.how_many).to eq 2
    end
  end

  context "after dish and quantity added" do
    it "Calculates the price" do
      expect(order.price(1, 2)).to eq 8
    end

    it "Updates total by calculated price" do
      order.price(1, 2)
      expect(order.total).to eq 8
    end

    it "Adds ordered dish and price to the array" do
      array = [{ :dish=>:v, :price=>4, :quantity=>3, :total=>12 }]
      expect { order.price(1, 3) }.to change { order.ordered_dishes }.by(array)
    end
  end

  describe "#ordering_menu" do

    before do
      $stdin = StringIO.new("no")
    end

    after do
      $stdin = STDIN
    end

    it "Asks if user would like to add more positions to the order" do
      allow(order).to receive(:price) { 8 }
      allow(order).to receive(:which_dish) { 1 }
      allow(order).to receive(:how_many) { 2 }
      message = "Would you like to add any more dishes? (yes/no)\n"
      expect {order.ordering_menu}.to output(message).to_stdout
    end

    it "Gets and interprets answer from the user" do
      expect(order.more?).to eq false
    end
  end

  # it "shows order" do
  #   expect {order.show_order}.to output(String).to_stdout
  # end

end
