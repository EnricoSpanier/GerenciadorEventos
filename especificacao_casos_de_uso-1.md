# Casos de uso

<img width="680" height="420" alt="D_Organizaê drawio" src="https://github.com/user-attachments/assets/38891b5f-f6df-4d41-b917-a5eac20f1a9c" />

# Especificação dos Casos de Uso — App Organizador de Eventos "Organizaê"

| **Nome do Caso de Uso** | **Vizualizar Evento** |
|---|---|
| ***Ator Principal*** | Participante |
| ***Ator Secundário*** | Banco de Dados |
| ***Resumo*** | Esse caso de uso descreve as etapas percorridas onde o paricipante vê  uma lista de eventos podendo participar futuramente |
| ***Pré-Condição*** | |
| ***Pós Condição*** | pode iniciar o Participar Evento ou Cancelar Participação Evento |
| **Fluxo Principal** | --- |
| ***Ações do Ator*** | ***Ações do Sistema*** |
| 1. Participante entra no Organizaê |    |
|  | 2. exibe a home page |
| 3. Participante seleciona o evento desejado |  |
|  | 4.  Sistema exibe todos os detalhes do evento |
| 5. Participante fecha os detalhes do evento |   |
| **Fluxo Alternativo** | --- |
| 5a. Participante parcipa do evento |   |
|  | 6a.  Sistema inicia o caso de Paricipar Evento |
| **Fluxo Alternativo** | --- |
| 5b. Participante cancela a parcipação do evento |   |
|  | 6b.  Sistema inicia o caso de Cancelar Paricipação Evento |
| **Fluxo de Exceção** | --- |
| 1. | |
|  | 2. |
| **Restrições e Validações:** |  |

---

| **Nome do Caso de Uso**   |  Participar Evento  |  
|---|---|
| **Ator Principal** | Participante| 
| **Ator Secundário**  | Banco de Dados | 
| **Resumo** | Esse caso de uso descreve as etapas percorridas onde o participante confirma sua participação em um evento | 
| **Pré-Condição**| O usuário deve estar logado no sistema <br> O sistema deve estar na página do evento| 
| **Pós-Condição**| A participação do usuário ao evento é registrada no sistema | 
| **Fluxo Principal**  | ---  | 
| **Ações do Ator** | **Ações do Sistema** | 
| 1. Participante seleciona a opção "Participar" do evento|   |
|  | 2. Sistema requisita a confirmação da participação do usuário no evento |
| 3. Participante cofirma a participação   | |      
|  | 4. Sistema registra a participação do usuário no evento |
|  | 5. Sistema exibe mensagem de confirmação de participação |     
| **Fluxo Alternativo**  | --- | 
| | 1a. Sistema identifica que não a login na sessão |
| | 2a. Sistema redireciona para tela de login |
| 3a. Organizador insere suas credenciais | |
| | 4a. Sistema valida as credenciais com o banco de dados |
| **Fluxo de Exceção** | ---  | 
|  | 4b. Sistema exibe mensagem de erro no login e solicita nova tentativa | 
| **Restrições e Validações** | 1. Apenas usuários autenticados podem participar de eventos | 
|  | 2. O sistema deve impedir participação duplicada no mesmo evento |

---

| **Nome do Caso de Uso** | Cancelar Participação Evento |
| --- | --- |
| **Ator Principal** | Participante |
| **Ator Secundário** | Banco de Dados |
| **Resumo** | Esse caso de uso descreve as etapas percorridas onde o participante cancela sua participação previamente registrada em um evento |
| **Pré-Condição** | O usuário deve estar logado no sistema <br> O usuário deve ser participante no evento |
| **Pós-Condição** | A participação do usuário no evento é cancelada do sistema |
| **Fluxo Principal** | --- |
| **Ações do Ator** | **Ações do Sistema** |
| 1. Participante seleciona a opção "Cancelar Participação" no evento | |
| | 2. Sistema verifica se há participação registrada |
| | 3. Sistema requisita a confirmação do cancelamento da participação do usuário no evento |
| 4. Participante cofirma o cancelamento da participação | |
| |5. Sistema remove a participação do usuário no evento |
| | 6. Sistema exibe mensagem de confirmação de cancelamento |
| **Fluxo Alternativo** | --- |
| | 1a. Sistema identifica que não a login na sessão |
| | 2a. Sistema redireciona para tela de login |
| 3a. Organizador insere suas credenciais | |
| | 4a. Sistema valida as credenciais com o banco de dados |
| **Fluxo de Exceção** | --- |
| | 4b. Credenciais invalidas |
| | 5b.  Sistema exibe mensagem de erro no login e solicita nova tentativa | 
| **Fluxo de Exceção** | --- |
| | 2c. Participante não está participando do evento 
| | 3c. Sistema exibe mensagem informando que não há participação registrada |
| **Fluxo de Exceção** | --- |
| | 5d. Falha ao cancelar participação | 
| | 6d. Sistema exibe erro e sugere tentar novamente mais tarde |
| **Restrições e Validações** | 1. Apenas usuários autenticados podem cancelar participação | 
| | 2. Cancelamento só é possível se houver uma participação registrada previamente |

---

| **Nome do Caso de Uso** | **Criar Evento** |
|---|---|
| ***Ator Principal*** | Organizador |
| ***Ator Secundário*** | Banco de Dados |
| ***Resumo*** | Esse caso de uso descreve as etapas percorridas para  criar novos eventos |
| ***Pré-Condição*** | Estar logado no sistema Organizaê |
| ***Pós Condição*** | Evento cadastrado no sistema |
| **Fluxo Principal** |  |
| ***Ações do Ator*** | ***Ações do Sistema*** |
| 1. Organizador entra no Organizaê |  |
| 2. Organizador seleciona opção de criar evento | 
|  | 3. Sistema exibe a tela de criação de eventos na qual irá solicitar as informações do evento |
| 4. Usuário insere todas as informações nescessárias para o evento |  |
|  | 5. Sistema atualiza a lista de eventos e volta para a home page |
| **Fluxo Alternativo** | --- |
| | 3a. Sistema identifica que não a login na sessão |
| | 4a. Sistema redireciona para tela de login |
| 5a. Organizador insere suas credenciais | |
| | 6a. Sistema valida as credenciais com o banco de dados |
| **Fluxo de Exceção** | --- |
| 1. |  |
|  | 2. |
| **Restrições e Validações:** | 1. Apenas usuários autenticados podem criar eventos  |

---

| **Nome do Caso de Uso** | **Gerenciar Evento** |
|---|---|
| ***Ator Principal*** | Organizador |
| ***Ator Secundário*** | Banco de Dados |
| ***Resumo*** | Esse caso de uso descreve as etapas percorridas para  criar novos eventos |
| ***Pré-Condição*** | Estar logado no sistema Organizaê |
| ***Pós Condição*** |  |
| **Fluxo Principal** |  |
| ***Ações do Ator*** | ***Ações do Sistema*** |
| 1. Organizador entra no Organizaê |  |
| 2. Organizador seleciona opção meus eventos |
|  | 3. Sistema exibe todos os eventos do Organizador |
| 4. Organizador seleciona o evento desejado |  |
|  | 5. Sistema exibe as informações sobre o evento selecionado e permite alterações |
| 6. Organizador altera informações desejadas e salva as novas | |
|  | 7. Sistema atualiza a lista de eventos e volta para a home page |
| **Fluxo Alternativo** | --- |
| | 2a. Sistema identifica que não há login na sessão |
| | 3a.. Sistema redireciona para tela de login |
| 4a. Participante insere suas credenciais | |
| | 5a. Sistema valida as credenciais com o banco de dados | 
| 6b. Organizador opta por excluir o evento | |
| | 7b. Sistema requisita a confirmação da exclusão do evento |
| 8b. Organizador cofirma a exclusão | |
| |9b. Sistema remove o evento da lista de eventos |
| **Fluxo de Exceção** | --- |
| 1. | |
|  | 2. |
| **Restrições e Validações:** | 1. Apenas organizadores autenticados podem editar eventos  |
| | 2. Apenas o organizador que criou o evento pode gerencia-lo |
