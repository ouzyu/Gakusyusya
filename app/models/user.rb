class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :abilities
  has_many :quests
  belongs_to :actor

  def hours_minutes_seconds
    st = self.study_time
    h = st / 3600
    m = st % 3600 / 60
    s = st % 60
    h.to_s + "時間 " + m.to_s + "分 " + s.to_s + "秒"
  end

end
