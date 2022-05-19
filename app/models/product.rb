
class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: { greater_than_or_equal_to:0.01}
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {
        with:  %r{\.(gif|jpg|png)\z}i,
        message: 'must be a URL for GIF, JPG or PNG image'
    }
    #LEMBRAR SEMPRE!>>>  ll
    # • Os campos de título, descrição e URL da imagem não estão vazios.
    #• O preço é um número válido não inferior a US$ 0,01.
    # • O título é único entre todos os produtos. (uniquess: true)
    #• O URL da imagem parece razoável.
    #allow_blank evita receber varias mensagens de erro quando o campo está em branco!
#-------------------------------------
    #evita a remoção de produtos referenciados por itens de linha:
    
    has_many :line_itens
    before_destroy :ensure_not_referenced_by_any_line_item

    private
        def ensure_not_referenced_by_any_line_item
            unless line_items.empty?
                errors.add(:base, 'Line Items present')
                throw :abort #encerra a execução imediatamente
            end
        end
    
end



