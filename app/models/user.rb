class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  rolify
  has_many :courses
  def to_s
    email
  end

  def username
    self.email.split(/@/).first
  end

  after_create :assign_default_role

  protected

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) #any user can create their own courses
    end
  end


end
