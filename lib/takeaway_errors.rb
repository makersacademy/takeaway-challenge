class InvalidSelectionError < StandardError
  def initialize(msg="Item not found on Menu")
    super
  end
end

class ZeroQuantityError < StandardError
  def initialize(msg="Quantity must be at least 1")
    super
  end
end
