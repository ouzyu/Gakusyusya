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

  def hours_minutes_seconds
    st = self.study_time
    h = st / 3600
    m = st % 3600 / 60
    s = st % 60
    h.to_s + "じかん " + m.to_s + "ふん " + s.to_s + "びょう"
  end

end
