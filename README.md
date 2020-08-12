# desafio iddog

### Objetivo

#### :white_check_mark: Criar uma tela de login onde o usuário precisa digitar um endereço de email válido.
 A tela principal é a tela de login/signup. Por padrão ela é a tela principal e sob a condição do usuário não tem um token válido salvo localmente. Na condição do app detectar um token válido, ele direciona à tela do feed.
 
#### :white_check_mark: Armazene localmente o token retornado pela API no login.
O token é armazenado localmente utilizando a biblioteca [KeychainSwift](https://cocoapods.org/pods/KeychainSwift) que é responsável por encriptar o token de forma que ele não fique visível aos demais apps.
#### :white_check_mark: Após o login feito com sucesso, redirecione para uma tela onde deve conter as listas com as imagens.
Ao realizar o login, o usuário recebe um token. Se o token for válido, o app exibe um feed com fotos de cachorrinhos :dog:. Se não for, ele exibe uma mensagem de erro e retorna à tela de login.
#### :white_check_mark: Crie uma forma para que o usuário possa navegar entre as quatro raças de cachorros (husky, labrador, hound e pug).
A tela do feed é composta por uma _collection view_ com as "categories" (raças) de cães :dog: e uma _table view_ que exibe a lista retornada dos cães :dog:. Ao clicar sobre um dos cards da _collection view_, o app requisita nova lista com a raça selecionada e retorna à posição zero da _table view_.
#### :white_check_mark: Ao clicar em uma imagem, ela deve ser exibida de forma expandida.
A imagem selecionada da _table view_ é expandida numa nova _view_.

#### Extra
O usuário pode sair da tela de feed e seu token será deletado do armazenamento. Isso permitirá que ele entre no feed utilizando outro endereço de e-mail.

### Requisitos técnicos
#### :white_check_mark: Versão mínima: iOS 9.0 
#### :white_check_mark: Libs de terceiros
Foi utilizado o CocoaPods como gestor de dependências para 3 bibliotecas utilizadas neste projeto:

[Alamofire](https://github.com/Alamofire/Alamofire) é uma biblioteca que gerencia requisições HTTP, muito completa e poderosa que fornece uma interface de requisição simples e legível. A versão mais recente do Alamofire (5.2) não é compatível com o iOS 9.0, portanto este projeto utilizou da última versão compatível (4.0).

`pod 'Alamofire', '~> 4.0'`

[Nuke](https://github.com/kean/Nuke) é uma biblioteca de gerenciamento de download e cache de imagens. Essa lib já faz o cacheamento das imagens automaticamente, mas é possível definir configurações mais avançadas, como edição das imagens requisitadas, limite de cache, etc.

`pod 'Nuke', '~> 7.0'`

[KeychainSwift](https://cocoapods.org/pods/KeychainSwift) é uma biblioteca que facilita o uso de Keychains da Apple, recomendado para manter segurança de dados sensíveis no dispositivo, de forma que apps terceiros não tenham acesso a essas informações.

`pod 'KeychainSwift', '~> 19.0'`

#### :white_check_mark: Cache de imagens
O cache de imagens é feito automaticamente nas requisições feitas com a lib [Nuke](https://github.com/kean/Nuke).

### Decisões técnicas

#### Arquitetura
Utilizei a arquitetura MVVM na construção da aplicação, por ser uma arquitetura que visa estabelecer a separação de decisões de negócios e interface, mas seguindo um sistema simples. Acaba sendo uma arquitetura menos burocrática e mais flexível que o VIPER, mas que mantém a organização dos componentes bem feita.

#### _Swift_ + _Storyboards_
Linguagem utilizada: _Swift_ 5. 
Apesar da ascensão do uso de UISwift para construção das interfaces, optei por utilizar _Storyboards_ por ter mais familiaridade. Eu utilizo _Storyboards_ separadas com uma _View Controller_ pra cada e extesões de uso genérico de tipos que facilitam a chamada realizada via código. 

#### _Utils_ e _Components_
Utilizo também extensões para criar xibs de _Table View Cell_ e _Collection View Cell_ em componentes separados que podem ser reutilizados em qualquer parte do código posteriormente. Além disso, as extesões das classes permitem que eu faça validação dos tipos de forma limpa no código.

#### _Service_
Uso um _Service_ de requisição com a API para deixar os endpoints transparentes na _ViewModel_. Ela somente trata erro ou sucesso da requisição. O _Service_ utiliza o [Alamofire](https://github.com/Alamofire/Alamofire) e faz injeção de dependência dos objetos recebidos pela API.

#### Testes
Escrevi testes unitários e testes de interface simples pra avaliar o comportamento das _ViewModels_ e das telas de _login_ e _feed_.

### Imagens do app

| <img src="/images/splashscreen.png" width="250"> | <img src="/images/signupscreen.png" width="250"> | <img src="/images/feedscreen.png" width="250">
| <img src="/images/feedscreen2.png" width="250"> | <img src="/images/fullscreen.png" width="250"> | <img src="/images/homescreen.png" width="250">

Photos By:
- [Charles Deluvio](https://unsplash.com/photos/Mv9hjnEUHR4) 
- [Charles Deluvio](https://unsplash.com/photos/K4mSJ7kc0As) 
- [Dan Gold](https://unsplash.com/photos/U8hfWW6uRvk) 
- [Ilya Shishikhin](https://unsplash.com/photos/SCIRnLEtqWc) 
- [Evy Prentice](https://unsplash.com/photos/lnDHxCfxsOw) 
- [Hunter Thompson](https://unsplash.com/photos/R355LI0fSq8) 
