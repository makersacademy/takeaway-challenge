require 'options'

describe Options do
  let(:menu_items) { "some\ttest\tdata" }
  subject(:options) { described_class.new menu_items }
  describe '#request_selection' do
    # it 'prompts for a selection' do
    #   pending("awaiting clarification from other tests")
    #   expect { options.request_food_selection }
    #     .to output('Please make a selection').to_stdout
    # end
  end


end
