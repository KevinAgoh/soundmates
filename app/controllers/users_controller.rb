class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :show ]

  def index
    @users = policy_scope(User).limit(3)
  end

  def show
    @user = User.find_by(username: params[:username])
    authorize @user
  end

  #Collections by genre, methods

  def jazz
    @users = policy_scope(User.genre_id).where(name: "Jazz")
  end

  def hiphop
    @users = policy_scope(User).where(genre: "Rock")
  end

  def rock
    @users = policy_scope(User).where(genre: "Hip-Hop")
  end

  def electronic
    @users = policy_scope(User).where(genre: "Electronic")
    authorize @users
  end

  def funk
    @users = policy_scope(User).where(genre: "Funk/Soul")
  end

  #Collections by skills, methods

  def instrumentalists
    @users = policy_scope(User).where(skill: "Instruments")
  end

  def vocalists
    @users = policy_scope(User).where(skill: "Vocals")
  end

  def technicians
    @users = policy_scope(User).where(skill: "Technical")
  end

  def djs
    @users = policy_scope(User).where(skill: "DJ Mix")
  end

end
