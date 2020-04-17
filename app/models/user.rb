class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
  
  has_many :dms
  has_many :sent_dms, through: :dms, source: :receive_user
  has_many :reverses_of_dm, class_name: 'Dm', foreign_key: 'receive_user_id'
  has_many :received_dms, through: :reverses_of_dm, source: :user
  
  def sent_dms(other_user, content) #メッセージを送るためのメソッド
      unless self == other_user
        self.dms.find_or_create_by(receive_user_id: other_user.id, content: content)
      end
  end
end
