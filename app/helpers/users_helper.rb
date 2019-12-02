module UsersHelper
    def current_user?(user)
        return user.id == current_user.id
    end

end
