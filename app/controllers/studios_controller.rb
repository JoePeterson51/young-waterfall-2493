class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
    movie_ids = @movies.pluck(:id)
    actor_movies = ActorMovie.find_actor_movies(movie_ids)
    actor_ids = actor_movies.pluck(:actor_id)
    @actors = Actor.find_and_sort(actor_ids)
  end
end