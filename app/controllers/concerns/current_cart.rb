module CurrentCart 

    private 

      def set_cart 
        @cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        @cart = Cart.create 
        session[:cart_id] = @cart.id 
      end
    end

#O método set_cart obtém o :cart_id e tenta encontrar um carrinho correspondente a esse ID.

#rescue - Resgata uma exceção em ruby e em seguida especifica o erro que será chamado

#metodo .find retorna algo