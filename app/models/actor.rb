class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.find_and_sort(actor_ids)
    where(id: actor_ids, currently_working: true).order(age: :desc).pluck(:name).uniq
  end
end
