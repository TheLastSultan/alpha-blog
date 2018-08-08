class PeopleController < ApplicationController
    protect_from_forgery with: :null_session

    def get_ahmed
        render plain: "Ayyy AhmedBro. #{params}"
    end

    def post_ahmed
        render plain: "This is a post request. Post Requests are different because they have secret info. #{params}"
    end

    def render_view
        render view: "articles/new.html"
    end

end 