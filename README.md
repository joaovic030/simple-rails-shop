## Aplicação - Uma loja simples
#### Feito deploy no Heroku em: https://desolate-reaches-77194.herokuapp.com
### Uma aplicação construida para:
- Listar produtos para venda;
- Filtrar produtos por busca por nome, e ordenação.
- CRUD produtos para gestão;
- CRUD Cupons para poder criar descontos no carrinho;
- Exibir produto para adicionar/remover do carrinho;
- Exibir carrinho para realizar checkout, adicionar mais quantidades de produtos e cupom e realizar compra.
- Exibir Compras do usuário normal;
- Exibir todas as compras feitas - admin.

### Fluxo
- Login admin: admin@admin.com / admin123 || ordinary@user.com / ordinary123 (usuario sem privilegio admin)
- Visualizar listagem, clicar em um produto e adiciona-lo ao carrinho (quantos produtos quiser)
- Clickar no icone na barra superior para ser direcionado ao carrinho.
- Caso você for o admin é possivel ir em Coupons e verificar na listagem o Cupom criado pela aplicação, copiar o token dele e colar no carrinho e dar Apply.
- Voltando ao carrinho, deve se escolher a quantidade desejada de produtos, adicionar o cupom e finalizar compra em Order.
- Ainda tem CRUD de Produtos e Cupons e a listagem de Orders.

### O que foi utilizado e informações gerais
#### Linguagem e ferramentas
- Ruby 2.7.1
- Rails 6.1.3
- Postgresql 12.1
- Redis

#### Gems e outras bibliotecas utilizadas
- Devise
- Filterrific
- RSpec
- Capybara
- Kaminari
- Bootstrap
- Redis
____
### O que eu preciso fazer para executar e testar essa aplicação
**Deve-se trocar as configuracoes dos bancos em database.yml para as suas** <br>
### *Teste*
**Inicializando em modo `test`** <br>

`rails db:create db:migrate RAILS_ENV=test` <br>
`rake spec:models` <br>
> Seedar alguns dados necessários como usuarios para login no teste de feature.

`rails db:seed RAILS_ENV=test` <br>
`rake spec:features` <br>

### Dev
** Para rodar a aplicação local, basta rodar: `rails db:create db:migrate db:seed` e seguir o fluxo detalhado lá em cima.

### Pronto!
