class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  #belongs_to : Diz ao rails que as linhas em LineItens são filhas das linhas em cart e products
end
