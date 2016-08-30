
class InformationItem
  attr_reader :_id
  attr_reader :nickname
  attr_reader :gender
  attr_reader :province
  attr_reader :city
  attr_reader :signature
  attr_reader :birthday
  attr_reader :num_tweets
  attr_reader :num_follows
  attr_reader :num_fans
  attr_reader :sex_orientation
  attr_reader :marriage
  attr_reader :URL
end

class TweetsItem
  attr_reader :_id
  attr_reader :ID
  attr_reader :content
  attr_reader :pub_time
  attr_reader :co_oridinates
  attr_reader :tools
  attr_reader :like
  attr_reader :comment
  attr_reader :transfer
end

class FollowsItem
  attr_reader :_id
  attr_reader :follows
end

class FansItem
  attr_reader :_id
  attr_reader :fans
end


