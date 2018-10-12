require 'menu'

describe Menu do
  context '#display' do
    it 'displays each item with the price on a new line' do
      expect { subject.display }.to output("Margarita Pizza, £8\nHamburger, £6\nChips, £2\n").to_stdout
    end
  end
end
