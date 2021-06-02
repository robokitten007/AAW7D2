module ApplicationHelper
    def auth_token
        "<input type='hidden' name='authenticity_token' value='#{ from_authenticity_token}'>"
        .html_safe
    end 
end
