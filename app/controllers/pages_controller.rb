class PagesController < ApplicationController
    def index
        @test = { name: "things" }
    end
end
