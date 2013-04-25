class Qna
  include Plug
  HOSTNAME_WHITELIST = %w(www.stackoverflow.com stackoverflow.com www.quora.com quora.com)
  validate :whitelisted?, on: :create

  private
  def whitelisted?
    hostname = URI.parse(self.url).hostname
    unless HOSTNAME_WHITELIST.include?(hostname)
      errors.add(:whitelist, "resource should belong to #{HOSTNAME_WHITELIST.join(', ')}")
    end
  end
end
