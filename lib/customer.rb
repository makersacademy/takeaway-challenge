class Customer
  attr_reader :name, :tel, :postcode
  def initialize(options = {})
    @name = options[:name]
    @tel = options[:tel]
    @postcode = options[:pcode]
  end
end
