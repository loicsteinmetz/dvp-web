class StaticController < ApplicationController
  def home
    @title = 'DVP Web | Loïc Steinmetz, développeur freelance'
    @contents = Content.order(id: :asc)
    @times = TimeCv.order(order: :asc)
    @folios = []
    @folios << Folio.where(order: 0) << Folio.where(order: 1) << Folio.where(order: 2)
  end

  def portfolio
    @title = 'DVP Web - Portfolio | Loïc Steinmetz, développeur freelance'
  end

  def mentions_legales
    @title = 'DVP Web - Mentions légales | Loïc Steinmetz, développeur freelance'
  end

end
