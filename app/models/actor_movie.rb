class ActorMovie < ApplicationRecord
  belongs_to :actor
  belongs_to :movie

  def self.find_actor_movies(movie_ids)
    where(movie_id: movie_ids)
  end
end