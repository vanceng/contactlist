## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'

class ContactDatabase

  class << self 

    def initialize
      @contact_list = []
      CSV.readlines('Workbook1.csv').each do |contact|
        phone_numbers = []
        name = contact[0]
        email = contact[1]
          contact[2..-1].each do |phone|
            parts = phone.split(":")
            type = parts[0]
            digits = parts[1]
            phone_numbers << PhoneNumber.new(type, digits)
          end 
          @contact_list << Contact.new(name, email, phone_numbers)
      end
    end
    
    def save(contact)
      CSV.open('Workbook1.csv', "ab") do |csv|
        line = []
        line << contact.name
        line << contact.email
        contact.phone_numbers.each do |phone|
          line << "#{phone.type}: #{phone.number}"
        end
        csv << line
      end
    end

    def current_id
      @contact_list.size 
    end

    def list_of_contacts
      @contact_list
    end

    def find_contact(id)
      if id > current_id
        puts "not found"
      else
        @contact_list[id - 1] 
      end  
    end

    def find_contact_name(name)
      located_contact = @contact_list.select { |contact| contact.name == name }
      located_contact.empty? ? "No match" : located_contact
    end 

    def check_email(email)
      if @contact_list.any? { |contact| contact.email == email }
        true 
      else
        false 
      end
    end
  end

end




# puts "Your id number is #{@contactdatabase.size - 1}" 