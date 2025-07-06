class User < ApplicationRecord 
    VALID_EMAIL_REGEX = /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i
    validates :username, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: { minimum: 3, maximum: 25 }
    validates :email, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: { maximum: 105 },
                format: { with: VALID_EMAIL_REGEX }
end