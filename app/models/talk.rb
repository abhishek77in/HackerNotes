class Talk
  include Plug
  HOSTNAME_WHITELIST = %w(www.youtube.com youtube.com www.vimeo.com vimeo.com)
  validate :whitelisted?, on: :create

  private
  def whitelisted?
    hostname = URI.parse(self.url).hostname
    unless HOSTNAME_WHITELIST.include?(hostname)
      errors.add(:whitelist, "Talk should belong to Youtube.com or Vimeo.com")
    end
  end
end

