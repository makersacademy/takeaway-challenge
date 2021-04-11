class AvailabilityError < StandardError
  attr_reader :msg

  def initialize(msg = ["This dish is unavailable. Display the menu to view available dishes."])
    super(msg)
  end
end
