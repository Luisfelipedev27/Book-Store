class StoreController < ApplicationController
  def index
    @products = Product.order(:title) 
    #.order permite identificar o atributo requisitado 
    #order vai controlar a ordem em que os itens no site sao listados 
  end
end
