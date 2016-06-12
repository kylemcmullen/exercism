module Gigasecond
  GIGASECOND=10**9
  VERSION=1
  def self.from(date=Time.now)
    Time.at(date.to_i+GIGASECOND)
  end
end