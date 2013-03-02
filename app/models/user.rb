class User
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  field :nickname, type: String
  field :image, type: String
  attr_accessible :provider, :uid, :name, :email, :nickname, :image

  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.nickname = auth['info']['nickname'] || ""
         user.image = auth['info']['image'] || ""
      end
    end
  end

end
