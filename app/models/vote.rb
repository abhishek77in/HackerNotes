module Vote

  def votes_count
    self.votes.values.sum
  end

  def assign_vote(direction, user)
    if self.votes[user.nickname].present?
      if direction == 'up'
        self.votes[user.nickname] = (self.votes[user.nickname] + 1) unless self.votes[user.nickname] == 1
      elsif direction == 'down'
        self.votes[user.nickname] = (self.votes[user.nickname] - 1) unless self.votes[user.nickname] == -1
      end
    else
      if direction == 'up'
        self.votes[user.nickname] = 1
      elsif direction == 'down'
        self.votes[user.nickname] = -1
      end
    end
    self.save
  end

  def update_votes_count
    self.votes_counter = self.votes_count if self.votes_changed?
  end
end
