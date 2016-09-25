# encoding=utf-8
require_relative 'user_agent'
require_relative 'cookies'

class UserAgentMiddleWare
  def process_request(agent)
    agent.user_agent = $agents.sample
  end
end

class CookiesMiddleWare
  def process_request(agent)
    get_cookies(agent, $weibo_account)
    print agent.cookies
    time = Time.new.to_f
    agent.cookie_jar.save_as("cookies_#{ time }.txt")
  end
end

