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
    agent.cookies = $cookies.sample
  end
end

