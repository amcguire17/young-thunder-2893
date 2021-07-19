class MovieActorsController < ApplicationController
  def new

  end
  def create
    @movie = Movie.find(params[:id])
    @actor = Actor.where('name Ilike ?', "%#{params[:actor]}%")
    @movie.actors << @actor
    redirect_to "/movies/#{@movie.id}"
  end
end
