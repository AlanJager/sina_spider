require 'mechanize'
require_relative 'middleware'

class Spiders
  attr_reader :agent
  attr_reader :name
  attr_reader :host
  attr_reader :start_urls
  attr_reader :scrawl_ID
  attr_reader :finish_ID

  def initialize
    @agent = Mechanize.new()
    @name = 'sinaSpider'
    @host = 'http://m.weibo.cn/'
    @start_urls = [5235640836, 5676304901, 5871897095, 2139359753, 5579672076, 2517436943, 5778999829, 5780802073, 2159807003,
                   1756807885, 3378940452, 5762793904, 1885080105, 5778836010, 5722737202, 3105589817, 5882481217, 5831264835,
                   2717354573, 3637185102, 1934363217, 5336500817, 1431308884, 5818747476, 5073111647, 5398825573, 2501511785,
                  ]
    @scrawl_ID = Set.new(@start_urls)
    @finish_ID = Set.new()
    UserAgentMiddleWare.new().process_request(@agent)
    # CookiesMiddleWare.new().process_request(@agent)
    @agent.cookie_jar.load_cookiestxt('cookies.txt')
    url_information0 = "http://weibo.cn/%s/follow" % '2029177923'
    p page = @agent.get(url_information0)
  end

  def starts_request
    url_information0 = "http://weibo.cn/%s/follow" % '2029177923'
    p page = Mechanize.new().get(url_information0)
    # parse_personal_information_of_fans(@agent.get('http://weibo.cn/moegirlwiki'))
  end

  def parse_personal_information_of_fans(page)
    num_tweets = (page.search('div.u div.tip2 span.tc') =~ /\d/)
    # num_follows = (page.search('div.u div.tip2 a').first =~ /\d/)
    # num_fans = (page.search('div.u div.tip2 a').second =~ /\d/)
  end

  def parse_personal_information_of_self(page)
    information_items = InformationItem.new()
  end

  def parse_tweets_information(page)
    tweets_items = TweetsItem.new()
  end

  def parse_fans_and_follows
    items = Item.new()
  end
end

Spiders.new()#.starts_request
