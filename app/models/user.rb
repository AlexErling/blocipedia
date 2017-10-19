class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :wikis, dependent: :destroy
         
  before_save { self.email = email.downcase }
  before_save {self.role ||= :standard }

  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :standard
  end   
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validates :name, 
    length: {minimum: 2, maximum: 100}, 
    presence: true
  
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false},
    length: { minimum: 3, maximum: 254},
    format: { with: VALID_EMAIL_REGEX }
    
    
 def downgrade!
    ActiveRecord::Base.transaction do
      self.update_attribute(:role, :standard)
      self.wikis.where(private: true).all.each do |wiki|
        wiki.update_attribute(:private, false)
      end
    end
  end    
  
end
