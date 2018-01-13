class Price_list

  attr_reader :details

  def initialize(details)
    @details = details
  end

  def show
    list
  end

  private

  def list
    @details.each{|k, v| puts "#{k} : #{v}"}
  end
end
