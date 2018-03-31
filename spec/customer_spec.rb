require 'customer'

describe Customer do

  subject(:customer) { described_class.new }

  describe '#view_menu' do
    it 'lets the customer see a list of all menu items with prices' do
      output_format = <<~HEREDOC
      Sesame prawn toast £5.79
      Crispy seaweed £3.99
      Spring rolls £2.99
      Lemon chicken £5.89
      King prawns with cashew nuts £6.99
      HEREDOC
      expect(customer.view_menu).to eq(output_format)
    end

  end
end
