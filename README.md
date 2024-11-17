# Sistema de Gerenciamento de Restaurante

Este código implementa um modelo de banco de dados para um sistema de gerenciamento de restaurante. Ele abrange desde o cadastro de clientes e mesas até o controle de pedidos e itens do menu. A estrutura de dados foi projetada para suportar operações como o registro de pedidos, a alocação de mesas, o gerenciamento de itens do menu e a associação dos itens aos pedidos feitos pelos clientes.

## Estrutura do Banco de Dados

O banco de dados é composto por 5 tabelas principais:

### 1. **Tabela de Clientes (`clientes`)**
Essa tabela armazena as informações dos clientes do restaurante.

- **id_cliente**: Identificador único do cliente (chave primária).
- **nome**: Nome completo do cliente.
- **telefone**: Número de telefone do cliente.
- **email**: Endereço de e-mail do cliente.

### 2. **Tabela de Mesas (`mesas`)**
Essa tabela armazena informações sobre as mesas disponíveis no restaurante.

- **id_mesa**: Identificador único da mesa (chave primária).
- **capacidade**: Número de pessoas que a mesa pode acomodar.
- **disponibilidade**: Status da mesa, se está disponível (`true`) ou não (`false`).

### 3. **Tabela de Pedidos (`pedidos`)**
Armazena informações sobre os pedidos feitos pelos clientes.

- **id_pedido**: Identificador único do pedido (chave primária).
- **id_cliente**: Relacionamento com o cliente que fez o pedido (chave estrangeira referenciando `clientes`).
- **id_mesa**: Relacionamento com a mesa onde o pedido foi feito (chave estrangeira referenciando `mesas`).
- **data_pedido**: Data e hora do pedido.
- **status_pedido**: Status do pedido (ex.: 'Em andamento', 'Finalizado', etc.).

### 4. **Tabela de Itens do Menu (`itens_menu`)**
Armazena os itens disponíveis no menu do restaurante.

- **id_item**: Identificador único do item (chave primária).
- **nome**: Nome do item do menu (ex.: Hambúrguer, Pizza, etc.).
- **descricao**: Descrição detalhada do item.
- **preco**: Preço unitário do item.

### 5. **Tabela de Pedidos de Itens do Menu (`pedidos_itens_menu`)**
Essa tabela gerencia os itens que foram pedidos pelos clientes em cada pedido.

- **id_pedido**: Relacionamento com o pedido (chave estrangeira referenciando `pedidos`).
- **id_item**: Relacionamento com o item do menu (chave estrangeira referenciando `itens_menu`).
- **quantidade**: Quantidade do item pedido.
- **preco_unitario**: Preço unitário do item no momento do pedido.

## Funcionalidades

### 1. **Cadastro de Clientes**
O sistema permite o cadastro de novos clientes, armazenando suas informações pessoais, como nome, telefone e e-mail.

### 2. **Cadastro de Mesas**
As mesas disponíveis no restaurante são cadastradas no sistema, permitindo o gerenciamento da capacidade e disponibilidade. O restaurante pode verificar a disponibilidade de mesas para alocar clientes.

### 3. **Gerenciamento de Pedidos**
A cada novo pedido, o sistema registra as informações do cliente que fez o pedido, a mesa em que o pedido foi feito e o status atual do pedido. O status pode ser alterado conforme o progresso (ex.: "Em andamento", "Finalizado").

### 4. **Gestão do Menu**
O sistema permite o cadastro de itens no menu, com nome, descrição e preço. Isso permite que os clientes escolham os itens durante o pedido.

### 5. **Associação de Itens aos Pedidos**
Quando um pedido é feito, o sistema permite associar múltiplos itens do menu ao pedido, incluindo a quantidade e o preço unitário de cada item.

## Exemplo de Uso

### Inserindo Clientes

```sql
INSERT INTO clientes (nome, telefone, email)
VALUES
  ('João Silva', '(11) 9999-8888', 'joao.silva@gmail.com'),
  ('Maria Santos', '(11) 9876-5432', 'maria.santos@hotmail.com'),
  ('Pedro Albuquerque', '(11) 91234-5678', 'pedro.albuquerque@yahoo.com');
```

### Inserindo Mesas

```sql
INSERT INTO mesas (capacidade, disponibilidade)
VALUES
  (2, true),
  (4, true),
  (6, true),
  (8, true);
```

### Inserindo Itens do Menu

```sql
INSERT INTO itens_menu (nome, descricao, preco)
VALUES
  ('Hambúrguer', 'Pão, carne, queijo, alface, tomate e molho especial', 20.00),
  ('Pizza', 'Molho de tomate, mussarela, presunto, champignon e azeitona', 35.00),
  ('Salmão grelhado', 'Salmão grelhado com legumes e arroz', 50.00);
```

### Criando um Pedido

```sql
INSERT INTO pedidos (id_cliente, id_mesa, data_pedido, status_pedido)
VALUES
  (1, 2, NOW(), 'Em andamento');
```

### Inserindo Itens no Pedido

```sql
INSERT INTO pedidos_itens_menu (id_pedido, id_item, quantidade, preco_unitario)
VALUES
  (1, 1, 2, 20.00),
  (1, 3, 1, 50.00);
```

## Como Funciona

1. **Cadastro de Clientes**: Os clientes são registrados com informações básicas como nome, telefone e e-mail. Isso é útil para associar os pedidos aos clientes no futuro.
   
2. **Cadastro de Mesas**: O restaurante possui mesas com diferentes capacidades e status de disponibilidade. O sistema pode gerenciar a alocação das mesas aos clientes quando um pedido é feito.

3. **Gerenciamento de Pedidos**: Quando um cliente realiza um pedido, o sistema registra a mesa onde o pedido foi feito, a data e hora do pedido, e o status atual. O status pode ser atualizado para refletir o andamento do pedido.

4. **Itens do Menu**: O restaurante oferece itens do menu, que são cadastrados com nome, descrição e preço. Esses itens são posteriormente associados aos pedidos realizados pelos clientes.

5. **Pedidos de Itens**: O sistema registra os itens específicos que foram pedidos, a quantidade de cada item e o preço unitário no momento do pedido. Esse registro facilita o controle do que foi consumido e facilita a cobrança.

## Conclusão

Este modelo de banco de dados oferece uma solução simples e eficaz para o gerenciamento de clientes, mesas, pedidos e itens de menu de um restaurante. Ele facilita o controle de pedidos em tempo real e oferece a flexibilidade de alterar o status do pedido e adicionar/remover itens conforme necessário.
