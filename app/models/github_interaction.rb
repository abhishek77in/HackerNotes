module GithubInteraction
  extend ActiveSupport::Concern
  included do
    def self.from_github(auth)
      where(auth.slice("uid")).first || create_from_github(auth)
    end

    def self.create_from_github(auth)
      create! do |user|
        user.uid = auth['uid']
        if auth['info']
           user.name = auth['info']['name']
           user.nickname = auth['info']['nickname']
           user.image = auth['info']['image']
        end
      end
    end
  end
end
