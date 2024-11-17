-- Tabela de clientes
CREATE TABLE clientes (
  id_cliente SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL
);

-- Tabela de mesas
CREATE TABLE mesas (
  id_mesa SERIAL PRIMARY KEY,
  capacidade INTEGER NOT NULL,
  disponibilidade BOOLEAN NOT NULL
);

-- Tabela de pedidos
CREATE TABLE pedidos (
  id_pedido SERIAL PRIMARY KEY,
  id_cliente INTEGER REFERENCES clientes(id_cliente) NOT NULL,
  id_mesa INTEGER REFERENCES mesas(id_mesa),
  data_pedido TIMESTAMP NOT NULL,
  status_pedido VARCHAR(20) NOT NULL
);

-- Tabela de itens do menu
CREATE TABLE itens_menu (
  id_item SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de pedidos de itens do menu
CREATE TABLE pedidos_itens_menu (
  id_pedido INTEGER REFERENCES pedidos(id_pedido) NOT NULL,
  id_item INTEGER REFERENCES itens_menu(id_item) NOT NULL,
  quantidade INTEGER NOT NULL,
  preco_unitario DECIMAL(10, 2) NOT NULL
);

-- Inserir alguns clientes
INSERT INTO clientes (nome, telefone, email)
VALUES
  ('João Silva', '(11) 9999-8888', 'joao.silva@gmail.com'),
  ('Maria Santos', '(11) 9876-5432', 'maria.santos@hotmail.com'),
  ('Pedro Albuquerque', '(11) 91234-5678', 'pedro.albuquerque@yahoo.com');

-- Inserir algumas mesas
INSERT INTO mesas (capacidade, disponibilidade)
VALUES
  (2, true),
  (4, true),
  (6, true),
  (8, true);

-- Inserir alguns itens do menu
INSERT INTO itens_menu (nome, descricao, preco)
VALUES
  ('Hambúrguer', 'Pão, carne, queijo, alface, tomate e molho especial', 20.00),
  ('Pizza', 'Molho de tomate, mussarela, presunto, champignon e azeitona', 35.00),
  ('Salmão grelhado', 'Salmão grelhado com legumes e arroz', 50.00);

-- Inserir um pedido de cliente
INSERT INTO pedidos (id_cliente, id_mesa, data_pedido, status_pedido)
VALUES
  (1, 2, NOW(), 'Em andamento');

-- Inserir itens do menu em um pedido
INSERT INTO pedidos_itens_menu (id_pedido, id_item, quantidade, preco_unitario)
VALUES
  (1, 1, 2, 20.00),
  (1, 3, 1, 50.00);