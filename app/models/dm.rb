class Dm < ApplicationRecord
    validates :sender_id, {presence: true}
    validates :reciever_id, {presence: true}
	validates :content, {presence: true}
end
