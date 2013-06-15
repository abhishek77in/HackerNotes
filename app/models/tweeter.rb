class Tweeter
  include Plug
  HOSTNAME_WHITELIST = %w(www.twitter.com twitter.com)
  validate :whitelisted?, on: :create

  private
  def whitelisted?
    hostname = URI.parse(self.url).hostname
    unless HOSTNAME_WHITELIST.include?(hostname)
      errors.add(:whitelist, "Tweeter should belong to twitter.com")
    end
  end
end
