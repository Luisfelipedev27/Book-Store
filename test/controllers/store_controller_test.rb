require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select 'nav.side_nav a', minimum: 4  #Percorre o menu nav (Verifica se os 4 elementos estão presentes)
    assert_select 'main ul.catalog li', 3   #As proximas 3 linhas verificam se todos os produtos estão sendo exibidos
    assert_select 'h2', 'Programming Ruby 1.9' #Verifica se há um elemento h2 com esse mesmo título
    assert_select '.price', /\$[,\d]+\.\d\d/
    #verifica se o preço está formatado corretamente
  end
end

#assert_select verifica o parâmetro da primeira afirmativa

#Se o primeiro argumento for um elemento, seleciona todos os elementos correspondentes começando (e incluindo) esse elemento e todos os seus filhos em ordem de profundidade.

#Com os testes, garanto que as peças, models, views e controllers estão trabalhando juntos para produzir o resultado desejado