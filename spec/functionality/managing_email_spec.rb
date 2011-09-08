require 'spec_helper'

describe UniSender::Client do

  it 'should create email template' do
    answer = test_client.create_email_message(:sender_name=>'Ваня Петров', :sender_email=>'uni.sender.gem@gmail.com',
    :subject=>'You need your stuff', :list_id=>available_list_ids.last, :lang=>'en',
    :body=>"Привет дорогой друг! Тебе одиноко? Купи продукт от фирмы FooCompany и почувствуй себя счастливым.")
    answer.should include('result')
    answer['result']['message_id'].should be_an_kind_of(Numeric)
  end


  it 'should create sms template by name' do
    answer = test_client.create_sms_message(:sender=>'Tester',
    :list_id=>available_list_ids.last,:body=>"Просто смска with foo message")
    answer.should include('result')
    answer['result']['message_id'].should be_an_kind_of(Numeric)
  end

  it 'should create sms template by name' do
    answer = test_client.create_sms_message(:sender=>'1 234 4567890',
    :list_id=>available_list_ids.last,:body=>"Просто смска with foo message")
    answer.should include('result')
    answer['result']['message_id'].should be_an_kind_of(Numeric)
  end

end
