require './takeaway'

describe Takeaway do

  let (:takeaway) { Takeaway.new }
  it 'prints a list of dishes with prices' do
    expect { subject.create_menu }.to output("'Go-Away' - Take-Away Menu\n1: Pizza, £10\n      ---\n      \n2: Fries, £2\n      ---\n      \n3: Garlic Bread, £3\n      ---\n      \n").to_stdout
  end

  #Highest value dish is pizza at £10. **:order 1, 2** orders pizza and fries (£2) for a total of £12.
  #This test therefore, tests both story 2 and story 3.
  let (:chek) { double :check_object, :order => [1, 2]}
  it 'allows me to order several dishes' do
    @check = Check.new
    @order = chek.order
    @check.collate_check(@order)
    expect(takeaway.display_check(@check)).to eq 12
  end


end