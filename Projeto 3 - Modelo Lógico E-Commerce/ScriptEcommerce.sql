-- criação do banco de dados e-commerce
CREATE DATABASE Ecommerce;
USE Ecommerce;

-- criação da tabela cliente
CREATE TABLE IF NOT EXISTS Cliente(
    idCliente INT auto_increment PRIMARY KEY,
    Cnome VARCHAR(45),
    Endereco VARCHAR(45),
	CPF_CNPJ CHAR (14) NOT NULL UNIQUE,
    Pagamento_idPagamento Int,
	CONSTRAINT unique_cpf_cnpj_cliente UNIQUE (CPF_CNPJ),
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
    );
    
-- criação da tabela produto
CREATE TABLE IF NOT EXISTS Produto(
	idProduto INT auto_increment PRIMARY KEY,
    Pnome VARCHAR(45) NOT NULL,
    Categoria ENUM('Eletrônico', 'Alimento', 'Brinquedo', 'Móveis', 'Vestimenta') not null,
    Descricao VARCHAR(45),
	Valor FLOAT
);

    
-- criação da tabela pagamento
CREATE TABLE IF NOT EXISTS Pagamento(
	idPagamento INT auto_increment PRIMARY KEY,
    PagamentoCliente INT,
    Credito VARCHAR(45),
    Debito VARCHAR(45),
    PIX VARCHAR(45),
    Boleto VARCHAR(45)
);

-- criação tabela pedido
CREATE TABLE IF NOT EXISTS Pedido(
	idPedido INT auto_increment PRIMARY KEY,
    StatusPedido ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') DEFAULT 'Processando',
    DescricaoPedido VARCHAR(45),
    FretePedido FLOAT,
    Cliente_idCliente INT,
    Entrega_idEntrega INT,
    Pagamento_idPagamento INT,
    CONSTRAINT fk_cliente_pedido FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_entrega_pedido FOREIGN KEY (Entrega_idEntrega) REFERENCES Entrega(idEntrega),
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
    
);

-- criação tabela entrega
CREATE TABLE IF NOT EXISTS Entrega(
	idEntrega INT auto_increment PRIMARY KEY,
    DataPrevista VARCHAR(45),
    StatusEntrega ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') DEFAULT 'Processando' NOT NULL,
    CodigoRastreio VARCHAR(45)
	
);

-- criação tabela estoque
CREATE TABLE IF NOT EXISTS Estoque(
	idEstoque INT auto_increment PRIMARY KEY,
	LocalEstoque VARCHAR(45)
	
);

-- criação tabela fornecedor
CREATE TABLE IF NOT EXISTS Fornecedor(
	idFornecedor INT auto_increment PRIMARY KEY,
	CNPJ CHAR(14) not null UNIQUE,
    Quantidade INT NOT NULL,
    Contato VARCHAR(45),
    Constraint unique_fornecedor unique(CNPJ)
    );
    
    
-- criação tabela terceiro
CREATE TABLE IF NOT EXISTS Terceiro(
	idTerceiro INT auto_increment PRIMARY KEY,
	RazaoSocial VARCHAR(45) not null,
    LocalTerceiro VARCHAR(45) DEFAULT '0',
    CNPJ CHAR(14) NOT NULL,
	Contato VARCHAR(45),
    Constraint unique_terceiro unique(CNPJ)
    );
    
-- criação tabela produto terceiro
CREATE TABLE IF NOT EXISTS ProdutoTerceiro(
	Terceiro_idTerceiro INT,
    Produto_idProduto INT, 
	QuantidadeTerceiro INT DEFAULT 1,
	CONSTRAINT fk_produto_terceiro FOREIGN KEY (Terceiro_idTerceiro) REFERENCES Terceiro(idTerceiro),
    CONSTRAINT fk_produto_produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
    );
    
-- criação tabela produto fornecedor
CREATE TABLE IF NOT EXISTS ProdutoTerceiro(
	Fornecedor_idFornecedor INT,
    Produto_idProduto INT, 
	CONSTRAINT fk_produto_fornecedor FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_fornecedor_produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
    );
    
-- criação tabela produto em estoque
CREATE TABLE IF NOT EXISTS ProdutoEstoque(
    Produto_idProduto INT,
	Estoque_idEstoque INT,
	QuantidadeTerceiro INT DEFAULT 1,
	CONSTRAINT fk_em_estoque_estoque FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque),
    CONSTRAINT fk_em_estoque_produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
    ); 