require 'rspec'
require 'phone'
require 'email'
require 'address'
require 'contact'


describe 'Contact'  do
  it 'is initialized with a name' do
    test_contact = Contact.new('John Smith')
    test_contact.should be_an_instance_of Contact
  end
  it 'create an instance of contact' do
    test_contact = Contact.new('John Smith')
    test_contact.should eq test_contact
  end

  describe '.all' do
    it 'starts as an empty array' do
      Contact.all.should eq []
    end
    it 'adds a contact to the all contacts array' do
      test_contact = Contact.create('John Snow')
      Contact.all.should eq [test_contact]
    end
  end

  describe 'address_create' do
    it 'adds an address to a contact' do
      test_contact = Contact.create('John Snow')
      test_address = test_contact.address_create '123 main', 'Buffalo', 'NY', '12345'
      test_address.should be_an_instance_of Address
    end
  end

  # describe 'address_delete' do
  #   it 'deletes an address from a contact' do
  #     test_contact = Contact.create('John Snow')
  #     test_address = test_contact.address_create '123 main', 'Buffalo', 'NY', '12345'
  #     test_contact.address_delete(test_address).should eq
  #   end
  # end

  describe '.create' do
    it 'creates a new intance of conact' do
      test_contact = Contact.create('John Snow')
      test_contact.should be_an_instance_of Contact
    end
  end
end

describe 'Address' do
  it 'is initialized with an address' do
    test_address = Address.new('123 Main Street', 'Jackson', 'IL', '32456')
    test_address.should be_an_instance_of Address
  end
end


