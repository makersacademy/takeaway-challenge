require 'order'

describe Order do 
  let(:menu) { double(:menu, items: { pizza: 8, burger: 10, chips: 3 }) }
  let(:user_input) { ["pizza\n",
    "burger\n",
    "\n"] 
  }
  let(:expected_output) { ["Pizza: £8\n",
                           "Burger: £10\n",
                           "Chips: £3\n"
                          ].join("") 
  }
  let(:expected_output2) { ["Burger x 3: £30\n",
                            "Chips x 3: £9\n", 
                            "Total: £39\n",
                            "Total is correct\n"
                           ].join("")
  }

  before do
    allow(STDIN)
      .to receive(:gets).and_return(*user_input)
  end

  let(:subject) { described_class.new(menu) }

  describe '#initialization' do 
    it 'returns the menu to view' do 
      expect(subject.menu).to eq({ pizza: 8, burger: 10, chips: 3 })
    end
  end

  describe '#show_menu' do 
    it 'prints menu to standard output' do 
      expect { subject.show_menu
      }.to output(expected_output).to_stdout
    end
  end

  describe '#order' do 
    it 'defaults with a quantity of 1' do 
      subject.order("burger")
      expect(subject.basket[:burger]).to eq 1
    end
    it 'adds an item to the basket' do 
      subject.order("pizza", 5)
      expect(subject.basket).to include({ pizza: 5 })
    end
    it 'raises an error for non-existent item' do 
      expect { subject.order("tuna", 2) }.to raise_error("Item not in menu, please try again")
    end
  end

  describe '#print_basket' do 
    it 'prints the basket with total' do 
      subject.order('burger', 3)
      subject.order('chips', 3)
      p subject.basket
      expect { subject.print_basket }.to output(expected_output2).to_stdout
    end
  end

  describe '#send_sms' do 
    it 'sends an sms' do 
      expect(subject.send_sms(ENV["TEST_SID"], ENV["TEST_TOKEN"], ENV["TEST_OUTBOUND"], ENV["TEST_INBOUND"], FakeSMS)
        ).to include ENV["TEST_INBOUND"]
    end
  end
end
