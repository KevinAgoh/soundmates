class UserPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end
  end

  def show?
    true
  end
  
  #Collections by genre, methods

  def jazz
    true 
  end

  def hiphop
    true 
  end

  def rock
    true
  end

  def electronic
    true
  end

  def funk
    true
  end

  #Collections by skills, methods

  def instrumentalists
    true
  end

  def vocalists
    true
  end

  def technicians
    true
  end

  def djs
    true
  end 

end
