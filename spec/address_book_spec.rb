require 'rspec'
require 'phone'
require 'email'
require 'address'
require 'contact'


describe 'Contact'  do
  it 'create an instance of contact' do
    test_contact = Contact.new(name)
    test_contact.should eq [test_contact]
  end
end
