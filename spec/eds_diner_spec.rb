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
    before do
      allow(subject).to receive(:gets).and_return("1","2","quit")
    end

    let(:order) { { "1" => 1, "2" => 1 } }
    
    it 'shows menu + selection instructions when selecting dishes' do
      expect { subject.select_dishes }.to output(include("EdsDiner Menu:","Select item by number (e.g. 1) or 'quit'")).to_stdout
    end

    it 'Checks that the order is successfully added' do
      subject.select_dishes
      expect(subject.current_order).to eq order
    end


  end

end
