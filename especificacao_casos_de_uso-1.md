# Casos de uso

*Gerado em: 2025-09-04*

<img width="680" height="420" alt="D_Organizaê drawio" src="https://github.com/user-attachments/assets/38891b5f-f6df-4d41-b917-a5eac20f1a9c" />

# Especificação dos Casos de Uso — App Organizador de Eventos "Organizaê"

*Gerado em: 2025-09-04*

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
|  | 2. exibe menu de opções |
| 3. Participante seleciona a opção de vizualizar evento |  |
|  | 4. Sistema exibe todos os eventos disponiveis |
| 5. Participante seleciona o evento desejado |  |
|  | 6.  Sistema exibe todos os detalhes do evento |
| 7. Participante faz sai do app ou volta ao menu de opções |   |
| **Fluxo Alternativo** | --- |
| 7a. Participante parcipa do evento |   |
|  | 8a.  Sistema inicia o caso de Paricipar Evento |
| **Fluxo Alternativo** | --- |
| 7b. Participante cancela a parcipação do evento |   |
|  | 8b.  Sistema inicia o caso de Cancelar Paricipação Evento |
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
| **Pré-Condição**| O usuário deve estar logado no sistema| 
| **Pós-Condição**| A participação do usuário ao evento é registrada no sistema | 
| **Fluxo Principal**  | ---  | 
| **Ações do Ator** | **Ações do Sistema** | 
| 1. Participante seleciona a opção "Participar" no evento|   |
|  | 2. Sistema requisita a confirmação da participação do usuário no evento |
| 3. Participante cofirma a participação   | |      
|  | 4. Sistema exibe mensagem de confirmação de participação |
|  |5. Sistema registra a participação do usuário no evento |     
| **Fluxo Alternativo**  | --- | 
|  | 2a. Sistema redireciona para tela de login |   
| 3a. Participante insere suas credenciais | |  
|  | 4a. Sistema valida as credenciais com o banco de dados | 
| **Fluxo de Exceção** | ---  | 
|  | 4a. Sistema exibe mensagem de erro no login e solicita nova tentativa | 
| **Restrições e Validações** | 1. Apenas participantes autenticados podem participar de eventos | 
|  | 2. O sistema deve impedir participação duplicada no mesmo evento |

---

| **Nome do Caso de Uso** | Cancelar Participação Evento |
| --- | --- |
| **Ator Principal** | Participante |
| **Ator Secundário** | Banco de Dados |
| **Resumo** | Esse caso de uso descreve as etapas percorridas onde o participante cancela sua participação previamente registrada em um evento |
| **Pré-Condição** | O usuário deve estar logado no sistema e já ter confirmado sua participação nesse evento |
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
| | 2a. Sistema redireciona para tela de login |
| 3a. Participante insere suas credenciais | |
| | 4a. Sistema valida as credenciais com o banco de dados | 
| **Fluxo de Exceção** | --- |
| | 4a. Credenciais invalidas |
| | 5a.  Sistema exibe mensagem de erro no login e solicita nova tentativa | 
| **Fluxo de Exceção** | --- |
| | 2b. Participante não está participando do evento 
| | 3b. Sistema exibe mensagem informando que não há participação registrada |
| **Fluxo de Exceção** | --- |
| | 5c. Falha ao cancelar participação | 
| | 6c. Sistema exibe erro e sugere tentar novamente mais tarde |
| **Restrições e Validações** | 1. Apenas usuários autenticados podem cancelar participação | 
| | 2. Cancelamento só é possível se houver uma participação registrada previamente |

---

| **Nome do Caso de Uso** | **Criar Evento** |
|---|---|
| ***Ator Principal*** | Organizador |
| ***Ator Secundário*** | Banco de Dados |
| ***Resumo*** | Esse caso de uso descreve as etapas percorridas para  criar novos eventos |
| ***Pré-Condição*** | Estar logado no sistema Organizaê |
| ***Pós Condição*** |  |
| **Fluxo Principal** |  |
| ***Ações do Ator*** | ***Ações do Sistema*** |
| 1. Organizador entra no Organizaê |  |
|  | 2. exibe menu de opções |
| 3. Organizador seleciona opção de criar evento |
| | 4. Sistema redireciona para tela de login |
| 5. Participante insere suas credenciais | |
| | 6. Sistema valida as credenciais com o banco de dados | 
|  | 7. Sistema exibe a tela de criação de eventos na qual irá solicitar as informações do evento |
| 8. Usuário insere todas as informações nescessárias para o evento |  |
|  | 9. Sistema atualiza a lista de eventos e volta para a tela do menu de opões |
| 10. Organizador faz Logout ou seleciona uma opção nova | |
|  | 11. Sistema exibe tela de opções ou fecha |
| **Fluxo Alternativo** | --- |
| 1. | |
|  | 2. |
| **Fluxo de Exceção** | --- |
| 1. | |
|  | 2. |
| **Restrições e Validações:** | 1. Apenas participantes autenticados podem criar eventos  |

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
|  | 2. exibe menu de opções |
| 3. Organizador seleciona opção de gerenciar evento |
| | 4. Sistema redireciona para tela de login |
| 5. Participante insere suas credenciais | |
| | 6. Sistema valida as credenciais com o banco de dados | 
|  | 7. Sistema exibe todos os eventos do Organizador |
| 8. Organizador seleciona o evento desejado |  |
|  | 9. Sistema exibe as informações sobre o evento selecionado e permite alterações |
| 10. Organizador altera informações desejadas e salva as novas | |
|  | 11. Sistema atualiza a lista de eventos e volta para a tela do menu de opões |
| 12. Organizador faz Logout ou seleciona uma opção nova | |
|  | 13. Sistema exibe tela de opções ou fecha |
| **Fluxo Alternativo** | --- |
| 10a. Organizador opta por excluir o evento | |
| | 11a. Sistema requisita a confirmação da exclusão do evento |
| 12a. Organizador cofirma a exclusão | |
| |13a. Sistema remove o evento da lista de eventos |
| **Fluxo de Exceção** | --- |
| 1. | |
|  | 2. |
| **Restrições e Validações:** | 1. Apenas organizadores autenticados podem criar eventos  |
| | 2. Apenas o organizador que criou o evento pode gerencia-lo |
