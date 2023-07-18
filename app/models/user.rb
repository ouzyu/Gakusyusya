class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :abilities
  has_many :quests
  belongs_to :actor

  validates :name,  presence: true, length: { in: 1..10 }
  validates :email, presence: true, uniqueness: true

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.actor_id = 1
    end
  end

  def hours_minutes_seconds
    st = self.study_time
    h = st / 3600
    m = st % 3600 / 60
    s = st % 60
    h.to_s + "じかん " + m.to_s + "ふん " + s.to_s + "びょう"
  end

end
