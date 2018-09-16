class PriceError < StandardError
  def initialize(msg = "Difference in Price between Customer and Vendor")
    super
  end
end
