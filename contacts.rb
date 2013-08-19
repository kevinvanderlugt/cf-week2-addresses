require 'highline/import'

class Person
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :phone
  attr_accessor :age

  def full_name
    first_name + " " + last_name
  end
end

class Contacts
  NAME_JUSTIFY  = 30
  PHONE_JUSTIFY = 12
  AGE_JUSTIFY   = 8

  def self.run
    people = []

    loop do
      command = ask("> ")

      if command == "list"
        puts "Name".ljust(NAME_JUSTIFY) + 
              "Phone".rjust(PHONE_JUSTIFY) + 
              "Age".rjust(AGE_JUSTIFY)
        puts "-" * (NAME_JUSTIFY + PHONE_JUSTIFY + AGE_JUSTIFY)
        people.each do |person|
          puts person.full_name.ljust(NAME_JUSTIFY) + 
                person.phone.rjust(PHONE_JUSTIFY) + 
                person.age.rjust(AGE_JUSTIFY)
        end

      elsif command == "add"
        person = Person.new

        person.first_name = ask("First Name: ")
        person.last_name  = ask("Last Name: ")
        person.phone      = ask("Phone: ")
        person.age        = ask("Age: ")

        people.push(person)
      elsif command == "quit"
        break
      end
    end
  end
end

Contacts.run
