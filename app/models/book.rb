class Book
  include Plug
  HOSTNAME_WHITELIST = %w(www.amazon.com amazon.com)
  validate :whitelisted?, on: :create

  private
  def whitelisted?
    hostname = URI.parse(self.url).hostname
    unless HOSTNAME_WHITELIST.include?(hostname)
      errors.add(:whitelist, "Book should belong to amazon.com")
    end
  end
end
