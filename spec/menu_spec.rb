require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'contains a list of dishes' do
    expect(menu.dishes).not_to be_empty
  end

  describe '#show_dishes' do
      # SHOULD THIS BE A FEATURE SPEC TEST INSTEAD OF UNIT TEST? IF SO, WHAT WOULD THE TEST LOOK LIKE USING DOUBLES?
      specify { expect { menu.show_dishes }.to output { menu.show_dishes }.to_stdout }
  end

end