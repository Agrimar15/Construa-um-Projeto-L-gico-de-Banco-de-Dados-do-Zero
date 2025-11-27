# Construa-um-Projeto-L-gico-de-Banco-de-Dados-do-Zero
Entrega do segundo desafio do curso de MySQL patrocinado pela Klabin e a DIO.
# 🔧 Projeto Banco de Dados - Oficina

Este repositório contém o desenvolvimento de um banco de dados relacional para o contexto de uma **oficina mecânica**. O projeto foi elaborado a partir de um esquema conceitual (modelo ER), transformado em esquema lógico e implementado em SQL.  

O objetivo é representar as principais entidades e operações de uma oficina, como clientes, veículos, ordens de serviço, mecânicos e peças utilizadas.

---

## 📐 Esquema Lógico

O banco de dados foi modelado com as seguintes tabelas:

- **clientes**: informações dos clientes (nome, CPF, telefone, endereço).
- **veiculos**: veículos cadastrados, vinculados a clientes.
- **mecanicos**: funcionários da oficina responsáveis pelos serviços.
- **ordens_servico**: ordens de serviço abertas para manutenção/reparo.
- **pecas**: catálogo de peças disponíveis.
- **servicos**: tipos de serviços oferecidos (troca de óleo, revisão, etc).
- **ordem_peca**: relação entre ordens de serviço e peças utilizadas.
- **ordem_servico_mecanico**: relação entre ordens de serviço e mecânicos responsáveis.

---
