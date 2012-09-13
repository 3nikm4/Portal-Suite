class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user
    
    # admin abilities
    if user.role?("Admin")
      can :manage, :all

    # auditor abilities
    elsif user.role?("Auditor")
      can :read, [Call, Contact, Device, DeviceAssignment, DeviceProblem, DeviceType, DeviceTest, DeviceBattery, Disposable, DisposableType, DeviceStatus, Location, LocationType, Patient, Practice, PatientAssignment]

    # tech abilities
    elsif user.role?("Tech")
      can :read, [Call, Contact]
      can :create, [Call, Contact]
      can :update, Call do |call|
        call.try(:user) == user
      end

    # staff abilities
    elsif user.role?("Staff")

      can :manage, :all
      cannot :manage, User
      cannot :manage, Group
      cannot :manage, Call
      can :read, Call
      can :create, Call
      can :update, Call do |call|
        call.try(:user) == user
      end

#      can :read, :all
#      can :create, [Call, Contact, Patient, Practice, Location, DeviceAssignment, Disposable]
#      can :manage, Device
#      can :update, Call do |call|
#        call.try(:user) == user
#      end

#      can :read, [Call, Contact, Device, DeviceProblem, DeviceTest, DeviceBattery, Disposable, DeviceStatus, Location, Patient, Practice, PatientAssignment, DeviceAssignment]
#      can :create, [Call, Contact, Device, DeviceProblem, DeviceTest, DeviceBattery, Disposable, DeviceStatus, Location, Patient, Practice, PatientAssignment, DeviceAssignment]
#      can :update, [Contact, Device, DeviceProblem, DeviceTest, DeviceBattery, Disposable, DeviceStatus, Location, Patient, Practice, PatientAssignment, DeviceAssignment]
    end

  end

end
