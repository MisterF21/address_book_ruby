require './lib/phone'
require './lib/email'
require './lib/address'
require './lib/contact'
require './lib/color'

@current_contact = []

def main_menu
  puts Color.blink_brown("**************** Address Book ****************")
  puts Color.green("Please press ") + Color.under_green("n") + Color.green(" to enter a new contact.")
  puts Color.blue("Please press ") + Color.under_blue("l") + Color.blue(" to add a list.")
  puts Color.red("Please press ") + Color.under_red("d") + Color.red(" if you wish to delete a contact")
  puts Color.light_black("Please press ") + Color.under_black("x") + Color.light_black(" to exit.")
  puts Color.blink_brown("**********************************************")
  main_choice = gets.chomp
  if main_choice == 'n'
    system "clear"
    add_contact
  elsif main_choice == 'l'
    system "clear"
    contact_list
  elsif main_choice == 'd'
    system "clear"
    delete_contact
  elsif main_choice =='x'
    system "clear"
    exit
  else
    system "clear"
    main_menu
  end
end

def add_contact
  puts Color.green "Enter the contact name."
  contact_name = gets.chomp
  @current_contact = Contact.create(contact_name)
  add_address
end

def delete_contact
  puts Color.red "Please enter the number of the contact you wish to delete."
  Contact.all.each_with_index do | contact, index |
    puts (index + 1).to_s + ". " + Contact.all[index].name
  end
  delete_choice = (gets.chomp.to_i) - 1
  Contact.all.each_with_index do | contact, index |
    if index == delete_choice
      Contact.all.delete_at(index)
    end
  end
  system "clear"
  contact_list
end

def add_address
  puts Color.green "Please enter the street."
  street = gets.chomp
  puts Color.green "Please enter the city."
  city = gets.chomp
  puts Color.green "Please enter the state."
  state = gets.chomp
  puts Color.green "Please enter the zip."
  zip = gets.chomp
  @current_contact.address_create(street, city, state, zip)
  system "clear"
  view_contact
end

def delete_address
  puts Color.red "Please enter the number of the address you wish to delete."
  @current_contact.contact_addresses.each_with_index do | address, index |
    puts (index + 1).to_s + ". " + address.street.to_s + " " + address.city.to_s + ", " + address.state.to_s + " " + address.zip.to_s
  end
  delete_choice = (gets.chomp.to_i) - 1
  @current_contact.contact_addresses.each_with_index do | address, index |
    if index == delete_choice
      @current_contact.address_delete(index)
    end
  end
  system "clear"
  view_contact
end

def add_phone
  puts Color.green "Please enter the phone number."
  number = gets.chomp
  @current_contact.phone_create(number)
  system "clear"
  view_contact
end

def delete_phone
  puts Color.red "Please enter the number of the phone number you wish to delete."
  @current_contact.contact_phones.each_with_index do |phone, index|
    puts (index + 1).to_s + ". " + phone.number.to_s
  end
  delete_choice = (gets.chomp.to_i) - 1
  @current_contact.contact_phones.each_with_index do |phone, index|
    if index == delete_choice
      @current_contact.phone_delete(index)
    end
  end
  system "clear"
  view_contact
end

def add_email
  puts Color.green "Please enter the email number."
  number = gets.chomp
  @current_contact.email_create(number)
  system "clear"
  view_contact
end

def delete_email
  puts Color.red "Please enter the number of the email you wish to delete."
  @current_contact.contact_emails.each_with_index do |email, index|
    puts (index + 1).to_s + ". " + email.email.to_s
  end
  delete_choice = (gets.chomp.to_i) - 1
  @current_contact.contact_emails.each_with_index do |email, index|
    if index == delete_choice
      @current_contact.email_delete(index)
    end
  end
  system "clear"
  view_contact
end

def contact_list
  puts Color.blue "These are your current contacts"
  Contact.all.each_with_index do |contact, index|
    puts (index + 1).to_s + ". " + Contact.all[index].name
  end

  puts Color.blue "Press the number to show that contacts information."
  if Contact.all.length > 0
    contact_choice = gets.chomp
    Contact.all.each_with_index do |contact, index|
      if(contact_choice.to_i - 1) == index
        @current_contact = Contact.all[index]
        system "clear"
        view_contact
      end
    end
  else
    system "clear"
    main_menu
  end
end

def view_contact
  puts Color.blue "Here is information about your contact:"
  puts Color.bold_blue @current_contact.name
  @current_contact.contact_addresses.each do |address|
    puts "\t" + Color.bold_blue(address.street.to_s) + " " +
                Color.bold_blue(address.city.to_s) + ", " +
                Color.bold_blue(address.state.to_s) + " " +
                Color.bold_blue(address.zip.to_s) + "\n"
  end

  @current_contact.contact_phones.each do |phone|
    puts "\t" + Color.bold_blue(phone.number.to_s) + "\n"
  end

  @current_contact.contact_emails.each do |email|
    puts "\t" + Color.bold_blue(email.email.to_s) + "\n"
  end
  puts Color.green "\nPress " + Color.under_green("a") + Color.green(" to add another address to this contact")
  puts Color.green "Press " + Color.under_green("p") + Color.green(" to add a phone number to this contact")
  puts Color.green "Press " + Color.under_green("e") + Color.green(" to add an email to this contact")
  puts Color.red "Press " + Color.under_red("d") + Color.red(" to delete an address from a contact")
  puts Color.red "Press " + Color.under_red("t") + Color.red(" to delete a phone number from a contact")
  puts Color.red "Press " + Color.under_red("i") + Color.red(" to delete an email from a contact")
  puts Color.blue "Press " + Color.under_blue("c") + Color.blue(" to return to the contact list.")
  puts Color.blue "Press " + Color.under_blue("m") + Color.blue(" to return to the main menu.")
  view_choice = gets.chomp
  if view_choice == 'm'
    system "clear"
    main_menu
  elsif view_choice == 'a'
    puts "\n"
    add_address
  elsif view_choice == 'p'
    puts "\n"
    add_phone
  elsif view_choice == 'e'
    puts "\n"
    add_email
  elsif view_choice == 'd'
    puts "\n"
    delete_address
  elsif view_choice == 't'
    puts "\n"
    delete_phone
  elsif view_choice == 'i'
     puts "\n"
    delete_email
  else
    system "clear"
    contact_list
  end
end
system "clear"
main_menu
