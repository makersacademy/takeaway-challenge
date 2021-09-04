require 'eds_diner'

describe EdsDiner do 

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
    
    let(:instructions) { "1. Show Menu\n2. Add To Order\n3. Show Current Order\n4. Order\n" }

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

    # it 'returns "order will arrive in 1 hour from now' do
    #   allow(subject).to receive(:gets).and_return("44", "quit")
    # end

    it 'displays warning if user tries to order with no items' do
      allow(subject).to receive(:gets).and_return("4", "quit")
      subject.order
      expect { subject.order_summary }.to output(include("There are no items in your current order")).to_stdout
    end
  end



end
