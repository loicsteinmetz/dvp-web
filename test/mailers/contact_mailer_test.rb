require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "contact" do
    infos = { first_name: 'John', last_name: 'Doe', email: 'john.doe@mail.com', tel: '0303030303', cie: 'cie corp', date: '2020-01-01', message: "Here is a message\ndisplayed on two lines." }
    # Create the email and store it for further assertions
    email = ContactMailer.contact_email(infos)
 
    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end
 
    # Test the sent email contains what we expect it to
    assert_equal ['john.doe@mail.com'], email.from
    assert_equal [ENV['PERSO_MAIL']], email.to
    assert_equal 'Contact : John Doe', email.subject
  end
end
