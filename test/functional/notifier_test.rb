require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["sandra_sovane@inbox.lv"], mail.to
    assert_equal ["sandra_sovane@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["sandra_sovane@inbox.lv"], mail.to
    assert_equal ["sandra_sovane@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
