class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    if user.admin?
        can :manage, :all
    elsif user.manager?
        can :read, :all
    elsif user.pengadaan?
        can :read, Obat
    elsif user.gudang?
        can :manage, Obat
    end
    
  end
end
