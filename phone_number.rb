class PhoneNumber

  attr_reader :type, :number

  def initialize(type, number)
    @type = type
    @number = number
  end 

  def to_s
    "#{type}:#{number} " 
  end

end
