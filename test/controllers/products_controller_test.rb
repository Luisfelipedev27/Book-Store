require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"
  end

  test "should get index" do
    get products_url 
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      
      post products_url, params: { 
        product: {
        description: @product.description,
        image_url: @product.image_url,
        price: @product.price,
        title: @title,
      }
    } #Alterado
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: {
      description: @product.description,
      image_url: @product.image_url,
      price: @product.price,
      title: @title,
    }
  } #Alterado
    assert_redirected_to product_url(@product)
  end

  test "can't delete product in cart" do 
    assert_difference('Product.count', 0) do 
      delete product_url(products(:two))
    end 

    assert_redirected_to products_url
  end

  test "should destroy product" do 
    assert_difference('Product.count', -1) do 
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end





#Testes unitários feitos. Considerações :
#• Garanti a presença dos campos obrigatórios.
#• Garanti que os campos de preço sejam numéricos e de pelo menos um centavo.
#• Garanti que os títulos sejam únicos.
#• Garanti que as imagens correspondam a um determinado formato.
#• Atualizei os testes unitários fornecidos pelo Rails, tanto para se adequar às restrições que impomos ao modelo quanto para verificar o novo código que adicionamos.
#
