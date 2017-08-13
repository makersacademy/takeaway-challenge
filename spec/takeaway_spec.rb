require 'takeaway'

describe Takeaway do
  let(:menu) { double :Menu }
  let(:restaurant) { double :Restaurant }
  let(:resto) { described_class.new(restaurant, "07767892911") }

  context "Initializes" do

    it "won't initialize without a restaurant and a number parameter" do
      expect { described_class.new }.to raise_error
    end

    it 'initializes with a restaurant and a user phone number' do
      expect(resto.name == "name" && resto.menu == menu1).to eq true
    end

  end

  context "reads menu" do

    it "calls read menu on restaurant's menu" do

    end

  end

  context "chooses dishes" do

    it "allows customers to add dishes to the basket" do

    end

  end

  context "shows basket" do

    it 'using show_basket the user can see the state of their current order' do

    end

  end


  context "checkout" do

    it "requires a card no. to pay the bill" do

    end

    it 'will not let any item be added to basket after checkout by marking takeaway as paid' do

    end

    it 'provides a summary of the order on checkout' do

    end

    it "sends a text upon completion of checkout" do

    end

  end

  xcontext "accepts orders by text" do

    it "takes a text order and adds items to menu" do

    end

  end


end
