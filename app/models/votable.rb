module Votable
  def up_vote(user)
    vote = find(user, self.class.name, self.id) || create(user, self.class.name, self.id)
    vote.value = 1
    vote.save
  end

  def down_vote(user)
    vote = find(user, self.class.name, self.id) || create(user, self.class.name, self.id)
    vote.value = -1
    vote.save
  end

  def find(user, type, type_id)
    Vote.where(user: user, type: type, type_id: type_id).first
  end

  def create(user, type, type_id)
    vote = Vote.new(user: user)
    vote.type = self.class.name
    vote.type_id = self.id
    vote.save
  end
end
