class Slide
  include Plug
  HOSTNAME_WHITELIST = %w(www.speakerdeck.com speakerdeck.com  www.slideshare.net slideshare.net)
  validate :whitelisted?, on: :create

  private
  def whitelisted?
    hostname = URI.parse(self.url).hostname
    unless HOSTNAME_WHITELIST.include?(hostname)
      errors.add(:whitelist, "Slide should belong to Speakerdeck.com or Slideshare.net")
    end
  end
end
