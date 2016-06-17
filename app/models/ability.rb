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
      can :read, Stock
    elsif user.gudang?
      can :read, Obat
      can :read, Stock
    end
  end
end
