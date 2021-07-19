class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.order_by_age
    order(:age)
  end

  def self.average_age
    average(:age)
  end

  def self.find_by_name(name)
    where('name Ilike ?', "%#{name}%")
  end
end
