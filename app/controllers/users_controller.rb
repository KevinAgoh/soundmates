class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :show ]

  def index
    if params[:query].present?
      sql_query = "\
      users.username @@ :query \
      OR users.first_name @@ :query \
      OR users.bio @@ :query \
      OR genres.name @@ :query \
      OR skills.name @@ :query \
      "
      # @users = policy_scope(User).where(sql_query, query: "%#{params[:query]}%")
      @users = policy_scope(User).joins(:genres, :skills).where(sql_query, query: "%#{params[:query]}%")
      # @users = policy_scope(User).includes(:trackable => [:genre, :skill]).where(sql_query, query: "%#{params[:query]}%")
    else
      @users = policy_scope(User).limit(3)
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    authorize @user
  end

  #Collections by genre, methods
  def search
  end

  def jazz
    @users = policy_scope(User.joins(:genres).where(genres: {name: "Jazz"}))
    authorize @users
  end

  def hiphop
    @users = policy_scope(User.joins(:genres).where(genres: {name: "Hip-Hop"}))
    authorize @users
  end

  def rock
    @users = policy_scope(User.joins(:genres).where(genres: {name: "Rock"}))
    authorize @users
  end

  def electronic
    @users = policy_scope(User.joins(:genres).where(genres: {name: "Electronic"}))
    authorize @users
  end

  def funk
    @users = policy_scope(User.joins(:genres).where(genres: {name: "Funk/Soul"}))
    authorize @users
  end

  #Collections by skills, methods

  def instrumentalists
    @users = policy_scope(User.joins(:skills).where(skills: {name: "Instruments"}))
    authorize @users
  end

  def vocalists
    @users = policy_scope(User.joins(:skills).where(skills: {name: "Vocals"}))
    authorize @users
  end

  def technicians
    @users = policy_scope(User.joins(:skills).where(skills: {name: "Technical"}))
    authorize @users
  end

  def djs
    @users = policy_scope(User.joins(:skills).where(skills: {name: "DJ Mix"}))
    authorize @users
  end

end
