require 'order'

describe Order do
  let(:dishlist) { [{:dish=>:v, :price=>4},
                      {:dish=>:v, :price=>3}] }
  subject(:order) { described_class.new(dishlist) }

  context "User chooses dish number" do
    before do
      $stdin = StringIO.new("1")
    end

    after do
      $stdin = STDIN
    end

    it "Asks for a dish number" do
      message = "Please choose index number of the dish you would like to order.\n"
      expect{order.which_dish}.to output(message).to_stdout
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
      expect{order.how_many}.to output(message).to_stdout
    end

    it "Lets uder enter number of portions" do
      expect(order.how_many).to eq 2
    end
  end

  it "Calculates the price" do
    expect(order.price(1, 2)).to eq 8
  end

end
