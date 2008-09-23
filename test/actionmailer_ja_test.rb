require 'test/unit'
require 'pp'
require File.expand_path(File.join(File.dirname(__FILE__), '../../../../config/environment.rb'))
#ENV['RAILS_ENV'] = 'development'
ENV['RAILS_ENV'] = 'test'
ActionMailer::Base::template_root = File.expand_path(File.join(File.dirname(__FILE__), "views"))

ActionMailer::Ja.auto_base64_encode = true
ActionMailer::Ja.auto_replace_safe_char = true
class ActionmailerJaTestNotifier < ActionMailer::Base
  def test
    @recipients  = "草苅景① <kei.kusakari+r@gmail.com>"
    setup_mail
  end

  def setup_mail
    @from        = "㈱草苅景 <kei.kusakari+f@gmail.com>"
    @subject     = "㈱№①"
    @sent_on     = Time.now
    headers 'return-path' => "kei.kusakari+r@gmail.com"
  end
end

class ActionmailerJaTest < Test::Unit::TestCase
  # Replace this with your real tests.
  def test_this_plugin
    email = ActionmailerJaTestNotifier.create_test
    pp "============================================"
    pp email.subject
    pp email.from
    pp email.cc
    pp email['return-path']
    ActionmailerJaTestNotifier.deliver(email)
  end
end

