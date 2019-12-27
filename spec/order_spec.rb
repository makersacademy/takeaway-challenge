require 'order'

describe Order do 
  let(:menu) { double :menu }
  let(:user_input) { ["pizza\n",
    "burger\n",
    "\n"] 
  }
  let(:expected_output) { [:pizza,
        :burger] 
  }
  let(:expected_output2) { ["Pizza: £8\n",
    "Burger: £10\n", 
    "Total: £18\n"
    ].join("")
  }

  before do
    allow(menu).to receive(:items) { ({ pizza: 8, burger: 10, chips: 3 }) }
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
      }.to output(["Pizza: £8\n",
                   "Burger: £10\n",
                   "Chips: £3\n"
      ].join("")).to_stdout
    end
  end

  describe '#order' do 
    it 'adds an item to the basket' do 
      subject.order("pizza", 5)
      expect(subject.basket).to include({ pizza: 5 })
    end
  end

  describe '#send_sms' do 
    it 'sends an sms' do 
      expect(subject.send_sms(ENV["TEST_SID"], ENV["TEST_TOKEN"], ENV["TEST_OUTBOUND"], ENV["TEST_INBOUND"], FakeSMS)
        ).to include ENV["TEST_INBOUND"]
    end
  end

end
