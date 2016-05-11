require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "list_to_friend" do
    mail = UserMailer.list_to_friend
    assert_equal "List to friend", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
