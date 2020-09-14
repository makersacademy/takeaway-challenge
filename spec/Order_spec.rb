require 'order'
require 'menu'

describe Order do

  dishes = {
    "Cassoulet" => 11,
    "Pan Bagnat" => 9,
    "Pasta arrabiatta" => 10
     }

  context "#add" do
  # let(:dish)     { double :dish, format: "Cassoulet" }
  
    it "adds a dish and quantity" do
      subject.add("Cassoulet", 2)
      expect(subject.order_list).to eq([{ name: "Cassoulet", quantity: 2, price_each: 11 }])
    end

    it "adds 2 different dishes and quantity" do
      subject.add("Cassoulet", 2)
      subject.add("Pan Bagnat", 3)
      expect(subject.order_list).to eq([{ name: "Cassoulet", quantity: 2, price_each: 11 }, { name: "Pan Bagnat", quantity: 3, price_each: 9 }])
    end
  end

  context "#total"

  it "return the total sum" do
    subject.add("Cassoulet", 2)
    subject.add("Pan Bagnat", 3)
  expect(subject.total).to eq 49
  end

  context "#print_menu"
  it 'prints the list of dishes' do
  expect(subject.print_menu).to eq(dishes)
  end
  
  context '#checkout?' 
      
    it 'double check the total is correct' do
      total = 49
      subject.add("Cassoulet", 2)
      subject.add("Pan Bagnat", 3)
      subject.total
      expect(subject.checkout?(total)).to eq true
    end

    it 'Or raises an error otherwise' do
      total = 48
      subject.add("Cassoulet", 2)
      subject.add("Pan Bagnat", 3)
      subject.total
      expect{subject.sum_ok?(total)}.to raise_error('No can do')
    end

  context "#complete_order"
      it "send a text confirming the order an total" do
      #
      end 

end
