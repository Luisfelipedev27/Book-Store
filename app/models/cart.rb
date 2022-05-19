class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
end
#has_many : Associação um para muitos.
#dependent - Assegura que a existência dos lineItens depende da existência do Cart (Carrinho).
#Se eu destruir o Cart, também o rails destruirá os LineItens associados a esse cart 
