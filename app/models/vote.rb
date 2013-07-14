module Vote
  def assign_vote(direction, user)
    username = user.nickname

    if first_vote?(username)
      cast_first_vote(direction, username)
    else
      vote_up(username) if direction == 'up'
      vote_down(username) if direction == 'down'
    end

    self.save
  end

  def first_vote?(username)
    self.votes[username].blank?
  end

  def cast_first_vote(direction, username)
    if direction == 'up'
      self.votes[username] = 1
    elsif direction == 'down'
      self.votes[username] = -1
    end
  end

  def vote_up(username)
    return if self.votes[username] == 1
    self.votes[username] = self.votes[username] + 1
  end

  def vote_down(username)
    return if self.votes[username] == -1
    self.votes[username] = self.votes[username] - 1
  end

  def votes_count
    self.votes.values.sum
  end

  def update_votes_count
    self.votes_counter = self.votes_count if self.votes_changed?
  end

end
