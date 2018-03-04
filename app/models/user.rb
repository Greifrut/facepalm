class User < ApplicationRecord
    # Authlogic 
    acts_as_authentic
    #

    #Зависимости для User => Friendship
end
