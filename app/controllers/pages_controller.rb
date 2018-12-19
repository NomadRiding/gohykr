class PagesController < ApplicationController
    def index
        @test = { name: "about", path:./About }
    end
end
