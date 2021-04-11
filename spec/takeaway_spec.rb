require 'takeaway'

describe Takeaway do

  let(:items) { double :items }
  let(:subject) { Takeaway.new }
  
  context "View items" do 
    it 'Displays the dishes along with prices' do
      expect(subject.items).to eq({ "Margarita" => 8.99, "Vegetarian" => 9.99, "Pepperoni" => 10.99, "Cheesecake" => 3.99, "Water" => 0.99 })
    end
    it 'Has an item that has a price for the user to select' do
      expect(subject.items["Margarita"]).to be > 0
    end
    it 'Allows the user to read the menu' do 
      expect(subject.read_menu).to eq(subject.items)
    end

    context "Select items" do
      it 'Allows the user to use the add command' do
        expect(subject).to respond_to(:add)
      end
      it 'Has an empty shopping cart by default' do
        expect(subject.shoppingcart).to eq([])
      end
      it 'Checks that an item can be added to the shopping cart' do
        subject.add("margarita")
        expect(subject.shoppingcart).to eq([8.99])
      end
      it 'Checks that the user can select several items on the list' do
        subject.add("Margarita")
        subject.add("Water")
        subject.add("Pepperoni")
        subject.add("Cheesecake")
        expect(subject.shoppingcart.count).to eq(4)
      end
      it 'Checks that the total amount is equal to the price of items added' do 
        subject.add("Margarita")
        subject.add("Water")
        subject.add("Pepperoni")
        expect(subject.total).to eq(20.97)
      end
    end

    context "Submitting an order" do 
      it "Can display the time on a users order" do
        expect(subject).to respond_to(:time)
      end

      it "Displays one hour after the current time when ordering" do 
        time = Time.now + 3600 # number of seconds
        expect(subject.time).to eq(time.strftime("%k:%M"))
      end

      it "Can send a text upon completion of order" do 
        subject.add("Water")
        expect(subject).to receive(:sendtext)
        subject.sendtext
      end
    end
  end
end
