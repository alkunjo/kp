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
      can :create, :read, Transaksi
    elsif user.gudang?
      can :read, Obat
      can :read, Stock
      can :read, :update, Transaksi
    end
  end
end
