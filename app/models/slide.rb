class Slide
  include Plug
  HOSTNAME_WHITELIST = %w(www.speakerdeck.com speakerdeck.com  www.slideshare.net slideshare.net)
  validate :whitelisted?, on: :create

  private
  def whitelisted?
    hostname = URI.parse(self.url).hostname
    unless HOSTNAME_WHITELIST.include?(hostname)
      errors.add(:whitelist, "resource should belong to #{HOSTNAME_WHITELIST.join(', ')}")
    end
  end
end
