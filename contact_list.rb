require_relative 'contact'
require_relative 'contact_database'
require_relative 'phone_number'

ContactDatabase.initialize 
command = ARGV[0]
identifier = ARGV[1] 

case command

  when 'help'
    puts "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact"
  when 'new'
    puts "What is their email address?"
    email = STDIN.gets.chomp
    while ContactDatabase.check_email(email) == true 
        puts "This email already exists, please enter a new one"
        email = STDIN.gets.chomp
      end
    puts "what is their name?"
    name = STDIN.gets.chomp
    puts "Do you want to enter a phone number? y/n"
    add_number = STDIN.gets.chomp
    phone_numbers = []
    while add_number == 'y' 
      puts "What type of number? Phone/Mobile/Skype"
      type = STDIN.gets.chomp
      puts "What is the number?"
      number = STDIN.gets.chomp
      phone_numbers << PhoneNumber.new(type, number)
      puts "Do you want to enter a phone number? y/n"
      add_number = STDIN.gets.chomp
    end 
    Contact.create(name, email, phone_numbers)
  when 'list'
    Contact.all
  when 'show'
    Contact.show(identifier.to_i) 
  when 'find'
    Contact.find(identifier)
end

