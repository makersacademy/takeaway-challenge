require 'eds_diner'

describe EdsDiner do 

  before do
    allow(subject).to receive(:load_menu).and_return(true)
    subject.dishes = { "1"=> { :name => "Tomato Soup", :price => 5 }, "2" =>{ :name => "Avocado On Toast", :price => 7 }, "3" => { :name => "Spaghetti Bolognese", :price => 12 }, "4" => { :name => "Mushroom Surprise", :price => 9 }, "5" => { :name => "Pizza", :price => 10 }, "6" => { :name => "Ice Cream", :price => 4}, "7" =>{ :name => "Cake", :price => 4 }}
  end

  context 'I would like to see a list of dishes with prices' do
    
    it 'stores meals in a hash' do
      expect(subject.dishes).to be_instance_of(Hash)
    end

    it 'prints list of items in menu' do
      expect { subject.show_menu }.to output(include("1. Tomato Soup  £5", "2. Avocado On Toast  £7")).to_stdout
    end

  end

  context 'I would like to be able to select some number of several available dishes' do



    let(:order_one) { { "1" => 1, "2" => 1 } }
    let(:order_two) { { "1" => 2, "2" => 1 } }
    
    it 'shows menu + selection instructions when selecting dishes' do
      allow(subject).to receive(:gets).and_return("1","2","quit")
      expect { subject.select_dishes }.to output(include("EdsDiner Menu:","Select item by number (e.g. 1) or 'quit'")).to_stdout
    end

    it 'Checks that the order is successfully added' do
      allow(subject).to receive(:gets).and_return("1","2","quit")
      subject.select_dishes
      expect(subject.current_order).to eq order_one
    end

    it 'Checks if adding two items adds 2 to the hash' do
      allow(subject).to receive(:gets).and_return("1","1","2","quit")
      subject.select_dishes
      expect(subject.current_order).to eq order_two
    end

    it "Checks if user output warning message if input is valid" do
      allow(subject).to receive(:gets).and_return("33","quit")
      expect { subject.select_dishes }.to output(include("Invalid Selection")).to_stdout
    end
  end

  context 'I would like to check that the total I have been given matches the sum of the various dishes in my order' do

    it 'Shows full order with total' do
      allow(subject).to receive(:gets).and_return("2","1","1","2","quit","quit")
      subject.order
      expect { subject.order_summary }.to output(include("2x Tomato Soup @ £5 = £10", "1x Avocado On Toast @ £7 = £7", "Total = £17")).to_stdout
    end

    it 'Checks that warning when display empty order' do
      allow(subject).to receive(:gets).and_return("3","quit")
      subject.order
      expect { subject.order_summary }.to output(include("There are no items in your current order")).to_stdout
    end


  end

  context 'Edge, added a "new order" function' do
    
    let(:instructions) { "1. Show Menu\n2. Add To Order\n3. Show Current Order\n4. Remove Item From Order\n5. Order\n" }

    it 'shows instructions' do
      allow(subject).to receive(:gets).and_return("quit")
      expect { subject.order }.to output(include(instructions)).to_stdout
    end

    it 'selects option 1 to show menu' do
      allow(subject).to receive(:gets).and_return("1", "quit")
      expect { subject.order }.to output(include("EdsDiner Menu:")).to_stdout
    end

    it 'checks for invalid menu selection' do
      allow(subject).to receive(:gets).and_return("44", "quit")
      expect { subject.order }.to output(include("Invalid Selection")).to_stdout
    end

  end

  context 'I would like to receive a text' do

    it 'displays warning if user tries to order with no items' do
      allow(subject).to receive(:gets).and_return("5", "quit")
      subject.order
      expect { subject.order_summary }.to output(include("There are no items in your current order")).to_stdout
    end

  end


  context 'dynamic menu on google sheets' do

    let(:correct_data) { { "1"=> { :name => "Tomato Soup", :price => 5 }, "2" =>{ :name => "Avocado On Toast", :price => 7 }, "3" => { :name => "Spaghetti Bolognese", :price => 12 }, "4" => { :name => "Mushroom Surprise", :price => 9 }, "5" => { :name => "Pizza", :price => 10 }, "6" => { :name => "Ice Cream", :price => 4}, "7" =>{ :name => "Cake", :price => 4 }}  }

    it 'Checks if loading the menu will initialize our class corrently' do
      subject.show_menu
      expect(subject.dishes).to eq correct_data
    end
  end


  context 'text messages' do

    let(:error_one) { {:code=>"400", :error=>"some message"} }
    let(:error_two) { {:code=>"500", :error=>"some message"} }


    it 'handles a failed response' do
      allow(subject).to receive(:gets).and_return("2","2","quit", "5", "quit")
      allow(subject).to receive(:send_text).and_return(error_one)
      expect { subject.order }.to output(include("some message")).to_stdout
    end

    it 'handles a failed response' do
      allow(subject).to receive(:gets).and_return("2","2","quit", "5", "quit")
      allow(subject).to receive(:send_text).and_return(error_two)
      expect { subject.order }.to output(include("some message")).to_stdout
    end

  end

  context 'remove items from selected' do

    let(:before_state)  { {"2"=>2, "3"=>1} }
    let(:after_state) { {"2"=>1, "3"=>1} }

    it 'raises error if current order is empty' do 
      allow(subject).to receive(:gets).and_return("4", "quit")
      subject.order
      expect { subject.order_summary }.to output(include("There are no items in your current order")).to_stdout
    end
    
    it 'removes an item from the current selected menu' do
      allow(subject).to receive(:gets).and_return("2", "1", "quit")
      subject.current_order = before_state
      subject.remove_items
      expect(subject.current_order).to eq after_state
    end
  end

end
