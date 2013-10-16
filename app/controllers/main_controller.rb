class MainController < ApplicationController
  def page
    @root = Text.root
    @texts = Text.where.not(id: @root.id).order('random()').take(5)

    @q = Text.search
  end
end
