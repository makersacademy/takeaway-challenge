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
  end

  let(:subject) { described_class.new(menu) }

  describe '#initialization' do 
    it 'prints menu to standard output' do 
      expect { described_class.new(menu)
      }.to output(["Pizza: £8\n",
                   "Burger: £10\n",
                   "Chips: £3\n"
      ].join("")).to_stdout
    end
    it 'returns the menu to view' do 
      expect(subject.menu).to eq({ pizza: 8, burger: 10, chips: 3 })
    end
  end

  describe '#selection' do 
    it 'returns the list of items with a total price' do 
      allow(STDIN)
      .to receive(:gets).and_return(*user_input)

      expect { subject.selection }.to output(/#{expected_output2}/m).to_stdout
    end
  end


  describe '#selection' do
    xit 'returns selection' do 
      set_user_input_and_check_expected_output
    end
  end
  

  def set_user_input_and_check_expected_output
    allow(STDIN)
    .to receive(:gets).and_return(*user_input)

    expect(subject.selection).to eq(expected_output)
  end

end
