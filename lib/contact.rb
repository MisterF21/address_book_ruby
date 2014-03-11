class Contact
  @@all_contacts = []

  def initialize(name)
    @name = name
    @addresses = []
    @phones = []
    @emails = []
  end

  def name
    @name
  end

  def Contact.all
    @@all_contacts
  end

  def Contact.create(name)
    new_contact = Contact.new(name)
    @@all_contacts << new_contact
    new_contact
  end

  def contact_delete(name)
    @@all_contacts.delete_at(name)
  end

  def contact_addresses
    @addresses
  end

  def contact_phones
    @phones
  end

  def contact_emails
    @emails
  end

  def street
    Address.street
  end

  def address_create(street, city, state, zip)
    new_address = Address.new(street, city, state, zip)
    @addresses << new_address
    new_address
  end

  def address_delete(address)
    @addresses.delete_at(address)
  end

  def phone_create(number)
    new_phone = Phone.new(number)
    @phones << new_phone
    new_phone
  end

  def phone_delete(number)
    @phones.delete_at(number)
  end

  def email_create(email)
    new_email = Email.new(email)
    @emails << new_email
    new_email
  end

  def email_delete(email)
    @emails.delete_at(email)
  end
end
