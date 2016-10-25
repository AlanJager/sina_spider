# encoding: utf-8
require 'mechanize'
require 'json'
require 'base64'
require_relative 'log'

weibo_account = [
    # add your account here
    'username' => '13408023291',
    'password' => 'xhnmdl11ER'
]

def get_cookies(agent, weibo_accounts)
  cookies = []
  loginURL = 'https://login.sina.com.cn/sso/login.php?client=ssologin.js(v1.4.15)'

  weibo_accounts.each do |e|
    account = e['username']
    password = e['password']
    username = Base64.strict_encode64(account)
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

    response = agent.post(loginURL, post_data)
    info = JSON.parse(response.body)

    if info['retcode'] == '0'
      print "Get Cookie Success!( Account:%s ) \n" % account
      cookies << agent.cookies
    else
      print 'Failed!( Reason:%s )' % info['reason']
    end
  end

  return cookies
end

def save_cookies(cookies)
  cookies_file = File.open("cookies.txt", "w+")
  cookies.each do |line|
    general_log("writing")
    cookies_file.syswrite(".weibo.cn  / FALSE  " + line.to_s.slice(0, line.to_s.index('=')) + 
                          " " + line.to_s.slice(line.to_s.index('='), line.to_s.length) + "\n")
  end
  cookies_file.close
end
# when need to run remove the notation
$cookies = get_cookies(Mechanize.new(), weibo_account)
# print 'Get Cookies Finish!( Num:%d)' % cookies.length
save_cookies($cookies.first)
