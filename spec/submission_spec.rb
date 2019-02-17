require_relative '../lib/submission'

describe Submission do
  
  subject(:submission) { described_class }
  let(:empty_order) { double(:empty_order, total: 0) }

  let(:selected_dishes) { [
    { quantity: 2, dish: "Small Cola", price: 0.60, subtotal: 1.20 },
    { quantity: 2, dish: "Cheesy Garlic Bread", price: 2.80, subtotal: 5.60 },
    { quantity: 1, dish: "Coconut Cake Slice", price: 1.50, subtotal: 1.50 }
  ]}
  
  let(:valid_order) {
    double(:valid_order, selected_dishes: selected_dishes, total: 8.30 )
  }

  # Valid order:
  # 2x Small Cola, 2x Cheesy Garlic Bread, 1x Coconut Cake Slice
  # £1.20 + £5.60 + £1.50
  
  it 'receives an empty Order, and raises an error' do
    error_message = "Add items to order first. Cannot submit empty order."
    expect { submission.new(empty_order) }.to raise_error error_message
  end

  it 'receives a valid Order, so no error raised' do
    expect { submission.new(valid_order) }.not_to raise_error
  end

  describe '.submit_order' do
    it 'submits the valid order, and a confirmation is sent by SMS' do
      # expect { submission.submit_order }
    end
  end
end
