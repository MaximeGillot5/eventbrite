class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end


    has_many :participations
    has_many :events, through: :participations

    has_many :events, foreign_key: 'admin_id', class_name: 'Event'
    def admin_events
      Event.where(admin_id: self.id)
    end
    def full_name
      [first_name, last_name].compact.join(' ')
    end
end
