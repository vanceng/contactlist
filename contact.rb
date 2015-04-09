class Contact
 
  attr_accessor :name, :email, :phone_numbers



  def initialize(name, email, phone_numbers=[])
    @name = name
    @email = email 
    @phone_numbers = phone_numbers

    # TODO: assign local variables to instance variables
  end
 
  def to_s
    message = "The name is #{name} and his/her email address is #{email} and has #{phone_numbers.length} numbers \n"
    phone_numbers.each { |phone| 
     message << phone.to_s + "\n" }
    message 
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email, phone_numbers)
      new_contact = Contact.new(name, email, phone_numbers)
      ContactDatabase.save(new_contact)
      puts "Your contact id is #{ContactDatabase.current_id}"
      # TODO: Will initialize a contact as well as add it to the list of contacts
    end
 
    def find(name)
      puts ContactDatabase.find_contact_name(name)
      # TODO: Will find and return contact by index
    end
 
    def all
      puts ContactDatabase.list_of_contacts
      # TODO: Return the list of contacts, as is
    end
    
    def show(id)
      puts ContactDatabase.find_contact(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end


