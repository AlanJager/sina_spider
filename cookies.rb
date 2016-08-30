# encoding: utf-8
require 'mechanize'
require 'json'
require 'base64'

weibo_account = [
    {'username' => '13408023291',
     'password' => 'xhnmdl11ER'},
]

def get_cookies(agent, weibo_accounts)
  cookies = []
  loginURL = 'https://login.sina.com.cn/sso/login.php?client=ssologin.js(v1.4.15)'

  weibo_accounts.each do |e|
    account = e['username']
    p password = e['password']
    p username = Base64.strict_encode64(account)
    post_data = {
        'entry'=> 'sso',
        'gateway'=> '1',
        'from'=> 'null',
        'savestate'=> '30',
        'useticket'=> '0',
        'pagerefer'=> '',
        'vsnf'=> '1',
        'su'=> username,
        'service'=> 'sso',
        'sp'=> password,
        'sr'=> '1440*900',
        'encoding'=> 'UTF-8',
        'cdult'=> '3',
        'domain'=> 'sina.com.cn',
        'prelt'=> '0',
        'returntype'=> 'TEXT',
    }

    p response = agent.post(loginURL, post_data)
    info = JSON.parse(response.body)

    if info['retcode'] == '0'
      print 'Get Cookie Success!( Account:%s )' % account
      cookie = agent.cookies
      cookies << cookie
    else
      print 'Failed!( Reason:%s )' % info['reason']
    end
  end

  return cookies
end

# when need to run remove the notation
# $cookies = get_cookies(Mechanize.new(), weibo_account)
# print 'Get Cookies Finish!( Num:%d)' % cookies.length