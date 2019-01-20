class Printer

  def self.print_nicely(array_hash)
    @a_h = array_hash
    set_headers
    @a_h.each { |e| @output += "#{e[@k1]}".ljust(20, ' ') + "#{e[@k2]}\n" }
    @output
  end

  private_class_method

  def self.set_headers
    @keys = @a_h[0].keys
    @k1 = @keys[0]
    @k2 = @keys[1]
    @output = "#{@k1}".ljust(20, ' ') + "#{@k2}\n"
  end

end
