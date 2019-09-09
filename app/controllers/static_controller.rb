class StaticController < ApplicationController
  def home
    @title = 'DVP Web | Loïc Steinmetz, développeur freelance'
  end

  def portfolio
    @title = 'DVP Web - Portfolio | Loïc Steinmetz, développeur freelance'
  end

  def mentions_legales
    @title = 'DVP Web - Mentions légales | Loïc Steinmetz, développeur freelance'
  end

end
