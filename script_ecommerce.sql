-- Criando database

create database ECOMMERCE;

------------------

-- Tabela Produtos
CREATE TABLE Produtos (
    ID_Produto SERIAL PRIMARY KEY,
    Nome TEXT NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT,
    Categoria VARCHAR(255)
);

-- Tabela Clientes
CREATE TABLE Clientes (
    ID_Cliente SERIAL PRIMARY KEY,
    Nome TEXT NOT NULL,
    Endereco TEXT,
    Telefone VARCHAR(15),
    Email TEXT,
    Data_Nascimento DATE
);

-- Tabela Pedidos
CREATE TABLE Pedidos (
    ID_Pedido SERIAL PRIMARY KEY,
    Data_Pedido TIMESTAMP NOT NULL,
    Status VARCHAR(50),
    Valor_Total DECIMAL(10, 2) NOT NULL,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Tabela Itens_Pedido
CREATE TABLE Itens_Pedido (
    ID_Item SERIAL PRIMARY KEY,
    Quantidade INT NOT NULL,
    Preco_Unitario DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    ID_Pedido INT,
    ID_Produto INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto)
);

-- Tabela Pagamentos
CREATE TABLE Pagamentos (
    ID_Pagamento SERIAL PRIMARY KEY,
    Data_Pagamento TIMESTAMP NOT NULL,
    Valor_Pago DECIMAL(10, 2) NOT NULL,
    Metodo_Pagamento VARCHAR(50),
    ID_Pedido INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);