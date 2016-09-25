# encoding: utf-8
require 'mechanize'
require 'json'
require 'base64'
# require_relative 'settings'


@agent = Mechanize.new()
url_personal_information = 'http://weibo.cn/attgroup/opening?uid=%s' % 5235640836
def parse_personal_information(url)
  # information_items = InformationItem.new()
  @agent.cookie_jar.load_cookiestxt('cookies.txt') 
  p @agent.get(url)
end

parse_personal_information(url_personal_information)

# p a = Settings.new().config['BOT_NAME']

