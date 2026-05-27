% Definição de ingredientes saudáveis
saudavel('batata').
saudavel('peixe').

% Base de dados de receitas
ingrediente('batata', 'cebola', 'pure de batata', 'como montar pure de batata').
ingrediente('batata'.'cheddar'.'batata frita','como montar uma batata frita com cheddar')
ingrediente('peixe', 'limao', 'isca de peixe', 'como montar isca de peixe').
ingrediente('peixe', 'batata', 'peixe com batata', 'como montar peixe com batata').
ingrediente('peixe', 'vinho', 'peixe ao molho de vinho', 'como montar peixe ao molho de vinho').
ingrediente('carne', 'cebola', 'strogonoff', 'como montar pure de batata').
ingrediente('carne', 'pao', 'hamburguer simples', 'como montar hamburger simples').
ingrediente('carne', 'mandioca', 'vaca atolada simples', 'como montar vaca atolada simples').
ingrediente('queijo', 'lasanha', 'como montar lasanha').
ingrediente('queijo', 'goiabada', 'romeu e julieta', 'como montar romeu e julieta').
ingrediente('queijo', 'nachos', 'nachos com queijo', 'como montar nachos com queijo').
ingrediente('queijo', 'macarrao', 'mac and cheese', 'como montar mac and cheese').

% Se pelo menos um dos ingredientes for saudável -> Receita Saudável
status_saude(Ing1, Ing2, Nome, 'Saudável') :- 
    ingrediente(Ing1, Ing2, Nome, _),
    (saudavel(Ing1) ; saudavel(Ing2)).

% Se nenhum dos dois for saudável -> Receita nao saudavel
status_saude(Ing1, Ing2, Nome, 'Nao_saudavel') :- 
    ingrediente(Ing1, Ing2, Nome, _),
    \+ saudavel(Ing1), 
    \+ saudavel(Ing2).