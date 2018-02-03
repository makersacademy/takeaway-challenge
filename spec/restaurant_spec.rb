require 'restaurant'

describe Restaurant do

  subject(:spices_of_india) { described_class.new }

  it { is_expected.to respond_to(:launch!) }

  describe '#introduction' do
    it 'outputs a greeting to the user' do
      intro = "\n<<< Welcome to Spices of India >>>\n"
      expect { spices_of_india.introduction }.to output(intro).to_stdout
    end
  end

  describe '#conclusion' do
    it 'outputs a farewell to the user' do
      outro = "\n<<< Goodbye! >>>\n\n"
      expect { spices_of_india.conclusion }.to output(outro).to_stdout
    end
  end

end
