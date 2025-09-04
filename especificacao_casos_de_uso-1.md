# Especificação dos Casos de Uso — App Organizador de Eventos

*Gerado em: 2025-08-18*

---

## Especificação do Caso de Uso: Login

### 1. Identificação
- **Caso de Uso:** Login  
- **Atores:** Usuário, Organizador  
- **Descrição:** Permitir que o usuário/organizador autentique-se no sistema para acessar funcionalidades protegidas.  
- **Pré-condições:** Conta existente (e-mail/senha ou SSO).  
- **Pós-condições:** Sessão autenticada; token de sessão emitido.

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator                           | Resposta do Sistema                                  |
|----------------------------------------|------------------------------------------------------|
| 1. Abrir tela de login                  | 1. Exibir formulário de autenticação                 |
| 2. Informar credenciais (e-mail + senha)| 2. Validar credenciais e criar sessão                |
| 3. Confirmar login                      | 3. Redirecionar para dashboard correspondente        |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                        | Resposta do Sistema                          |
|-----------------|-------------------------------------|----------------------------------------------|
| 2               | Escolher login via SSO               | Redirecionar ao provedor SSO e receber callback |
| 2               | Clicar em “Esqueci a senha”         | Iniciar fluxo de recuperação de senha via e-mail |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção                  | Resposta do Sistema                                         |
|-----------------|--------------------------------------|-------------------------------------------------------------|
| 2               | Credenciais inválidas                | Apresentar mensagem de erro e permitir nova tentativa       |
| 2               | Conta bloqueada/inativa              | Exibir aviso específico e bloquear acesso                   |
| 2               | Falha no serviço de autenticação SSO | Informar erro e permitir login manual                       |

---

## Especificação do Caso de Uso: Logout

### 1. Identificação
- **Caso de Uso:** Logout  
- **Atores:** Usuário, Organizador  
- **Descrição:** Encerrar a sessão autenticada do usuário/organizador.  
- **Pré-condições:** Sessão autenticada.  
- **Pós-condições:** Sessão invalidada; usuário redirecionado para tela pública.

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator               | Resposta do Sistema                                      |
|----------------------------|----------------------------------------------------------|
| 1. Clicar em “Sair/Logout” | 1. Invalidar token/sessão e limpar estado local          |
| 2. Confirmar saída         | 2. Redirecionar para a tela de login/página inicial      |

**Fluxos Alternativos**  
- Não aplicável.

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção       | Resposta do Sistema                             |
|-----------------|---------------------------|-------------------------------------------------|
| 1               | Erro ao invalidar sessão  | Limpar sessão local e notificar usuário         |

---

## Especificação do Caso de Uso: Cadastrar Usuário

### 1. Identificação
- **Caso de Uso:** Cadastrar Usuário  
- **Atores:** Usuário (não autenticado)  
- **Descrição:** Criar nova conta de usuário ou organizador no sistema.  
- **Pré-condições:** Acesso ao formulário de cadastro.  
- **Pós-condições:** Conta criada; e-mail de verificação enviado (se aplicável).

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator                         | Resposta do Sistema                                    |
|--------------------------------------|--------------------------------------------------------|
| 1. Abrir formulário de cadastro      | 1. Exibir campos (nome, e-mail, senha, tipo, etc.)     |
| 2. Preencher dados e submeter        | 2. Validar campos e criar conta (hash de senha)        |
| 3. Confirmar e-mail (se requerido)   | 3. Ativar conta após verificação                       |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                        | Resposta do Sistema                       |
|-----------------|-------------------------------------|-------------------------------------------|
| 2               | Escolher registro via SSO           | Criar conta automaticamente e vincular SSO |
| 2               | Inserir e-mail já cadastrado        | Informar duplicidade e sugerir recuperação|

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção                  | Resposta do Sistema                          |
|-----------------|--------------------------------------|----------------------------------------------|
| 2               | Dados inválidos (formato/senha fraca)| Mostrar erros de validação, não criar conta  |
| 3               | Falha no envio de e-mail             | Marcar como “pendente verificação” e notificar |

---

## Especificação do Caso de Uso: Editar Perfil

### 1. Identificação
- **Caso de Uso:** Editar Perfil  
- **Atores:** Usuário, Organizador  
- **Descrição:** Atualizar informações pessoais e preferências do usuário.  
- **Pré-condições:** Usuário autenticado.  
- **Pós-condições:** Perfil atualizado no sistema.

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator                         | Resposta do Sistema                                    |
|--------------------------------------|--------------------------------------------------------|
| 1. Acessar área de perfil            | 1. Carregar dados atuais do perfil                     |
| 2. Editar campos (nome, foto, etc.)  | 2. Validar alterações                                   |
| 3. Salvar alterações                 | 3. Persistir alterações e confirmar sucesso            |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                     | Resposta do Sistema                       |
|-----------------|----------------------------------|-------------------------------------------|
| 2               | Alterar e-mail                   | Requerer verificação do novo e-mail       |
| 2               | Alterar senha                    | Solicitar confirmação da senha atual      |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção        | Resposta do Sistema                            |
|-----------------|----------------------------|------------------------------------------------|
| 3               | Falha ao persistir dados   | Apresentar erro e manter versão anterior       |
| 2               | Upload de imagem inválido  | Informar restrição (tamanho/formatos)          |

---

## Especificação do Caso de Uso: Cadastrar Evento

### 1. Identificação
- **Caso de Uso:** Cadastrar Evento  
- **Atores:** Organizador  
- **Descrição:** Criar novo evento com dados essenciais; possibilitar seleção de localização via API de mapas e configurar pagamento se o evento for pago.  
- **Pré-condições:** Organizador autenticado (e verificado, se aplicável).  
- **Pós-condições:** Evento persistido; geolocalização resolvida (se usado mapa); configurações de pagamento salvas (se aplicável).

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator                                         | Resposta do Sistema                                              |
|------------------------------------------------------|------------------------------------------------------------------|
| 1. Abrir formulário “Cadastrar Evento”               | 1. Exibir campos (nome, data, hora, descrição, vagas, localidade, custo, imagem, políticas) |
| 2. Preencher dados e escolher local (endereço ou mapa)| 2. Validar campos e, se selecionado, geocodificar via API de Mapas|
| 3. (Opcional) Configurar pagamento para eventos pagos | 3. Integrar com gateway / armazenar configurações de pagamento   |
| 4. Submeter evento                                    | 4. Validar regras (datas, vagas), persistir evento e notificar sucesso |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                                         | Resposta do Sistema                                        |
|-----------------|------------------------------------------------------|------------------------------------------------------------|
| 2               | Inserir endereço manualmente (sem mapa)              | Aceitar endereço textual e salvar sem coordenadas         |
| 2               | API de Mapas retorna várias sugestões                | Apresentar opções para o organizador escolher             |
| 3               | Optar por pagamento offline                          | Marcar evento como “pago - método offline”                |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção                        | Resposta do Sistema                                             |
|-----------------|--------------------------------------------|-----------------------------------------------------------------|
| 2               | Data/hora em formato inválido ou no passado| Rejeitar submissão e solicitar correção                         |
| 2               | Vagas inválidas (<=0)                      | Rejeitar e exibir mensagem de validação                         |
| 3               | Falha na integração com gateway de pagamento| Salvar evento com pagamento desabilitado e notificar organizador|
| 2               | Falha na API de Mapas                      | Permitir salvar com endereço textual e registrar incidente      |

---

## Especificação do Caso de Uso: Listar Eventos

### 1. Identificação
- **Caso de Uso:** Listar Eventos  
- **Atores:** Usuário, Organizador  
- **Descrição:** Exibir lista de eventos disponíveis com filtros e ordenações.  
- **Pré-condições:** Nenhuma (ou autenticação para eventos privados).  
- **Pós-condições:** Lista exibida conforme filtros selecionados.

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator                        | Resposta do Sistema                                  |
|-------------------------------------|------------------------------------------------------|
| 1. Acessar tela/listagem de eventos | 1. Exibir lista inicial (paginada)                   |
| 2. Aplicar filtros/ordenações       | 2. Recarregar lista conforme critérios (data, proximidade, custo, categoria) |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                           | Resposta do Sistema                        |
|-----------------|----------------------------------------|--------------------------------------------|
| 2               | Usar pesquisa por texto                | Filtrar lista por similaridade de texto    |
| 1               | Trocar para visualização em mapa       | Exibir mapa com marcadores dos eventos     |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção       | Resposta do Sistema                     |
|-----------------|---------------------------|-----------------------------------------|
| 1               | Erro de carregamento      | Mostrar mensagem de erro e opção de retry|
| 2               | Filtros sem resultado     | Exibir indicação “nenhum evento encontrado”|

---

## Especificação do Caso de Uso: Visualizar Detalhes do Evento

### 1. Identificação
- **Caso de Uso:** Visualizar Detalhes do Evento  
- **Atores:** Usuário, Organizador  
- **Descrição:** Exibir informações completas do evento e opções de ação (participar, compartilhar, favoritar).  
- **Pré-condições:** Evento existente. Para informações restritas, permissão do usuário.  
- **Pós-condições:** Usuário visualiza detalhes; pode iniciar inscrição.

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator                           | Resposta do Sistema                                    |
|----------------------------------------|--------------------------------------------------------|
| 1. Selecionar evento na lista          | 1. Carregar e exibir página de detalhes (titulo, descr., data, local, mapa, vagas, custo, organizador, imagens) |
| 2. Clicar em “Participar/Comprar”     | 2. Redirecionar para fluxo de inscrição/pagamento      |
| 3. Usar recursos (mapa, compartilhar)  | 3. Abrir mapa ou painel de compartilhamento            |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                           | Resposta do Sistema                         |
|-----------------|----------------------------------------|---------------------------------------------|
| 1               | Evento privado                         | Solicitar código de convite / negar acesso  |
| 2               | Ver lista de participantes (se permitido)| Exibir lista parcial ou completa conforme permissão |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção             | Resposta do Sistema                                    |
|-----------------|---------------------------------|--------------------------------------------------------|
| 1               | Evento excluído ou expirado     | Exibir mensagem “evento não disponível”                |
| 2               | Erro ao carregar mapa           | Mostrar endereço textual e aviso de falha no mapa      |

---

## Especificação do Caso de Uso: Participar de Evento (Inscrição / Compra)

### 1. Identificação
- **Caso de Uso:** Participar de Evento  
- **Atores:** Usuário, Sistema de Pagamento (quando aplicável)  
- **Descrição:** Inscrever-se em evento; se for pago, realizar pagamento e garantir vaga.  
- **Pré-condições:** Usuário autenticado (ou permitido inscrição como convidado); vagas disponíveis.  
- **Pós-condições:** Usuário inscrito; vaga decrementada; confirmação enviada; registro de pagamento (se aplicável).

### 2. Fluxo de Eventos

**Fluxo Principal (evento gratuito)**  
------------------------------------------------------------------  
| Ação do Ator                      | Resposta do Sistema                                  |
|-----------------------------------|------------------------------------------------------|
| 1. Clicar em “Participar”         | 1. Verificar vagas disponíveis                       |
| 2. Confirmar participação         | 2. Registrar inscrição, decrementar vaga e enviar confirmação |

**Fluxo Principal (evento pago)**  
------------------------------------------------------------------  
| Ação do Ator                      | Resposta do Sistema                                  |
|-----------------------------------|------------------------------------------------------|
| 1. Clicar em “Comprar ingresso”   | 1. Reservar vaga temporariamente e iniciar checkout  |
| 2. Informar dados de pagamento    | 2. Encaminhar para gateway e processar pagamento     |
| 3. Confirmar pagamento            | 3. Registrar pagamento, gerar ingresso e enviar confirmação |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                         | Resposta do Sistema                         |
|-----------------|--------------------------------------|---------------------------------------------|
| 1               | Vagas insuficientes                  | Oferecer fila de espera ou recusar inscrição|
| 2 (pago)        | Escolher pagamento offline           | Registrar inscrição marcada como “aguardando pagamento offline” |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção                  | Resposta do Sistema                                         |
|-----------------|--------------------------------------|-------------------------------------------------------------|
| 1               | Concorrência: vagas esgotadas        | Cancelar tentativa, informar usuário e atualizar listagem   |
| 2 (pago)        | Falha na autorização do pagamento    | Informar erro, liberar vaga reservada e permitir nova tentativa |
| 3 (pago)        | Pagamento autorizado mas falha na persistência| Marcar transação para reconciliação e notificar suporte  |

---

## Especificação do Caso de Uso: Cancelar Participação

### 1. Identificação
- **Caso de Uso:** Cancelar Participação  
- **Atores:** Usuário, Organizador (para remoção)  
- **Descrição:** Permitir que participante cancele sua inscrição; organizador pode remover participantes. Lidar com reembolsos conforme política.  
- **Pré-condições:** Usuário inscrito no evento.  
- **Pós-condições:** Inscrição cancelada; vaga liberada; reembolso iniciado (se aplicável).

### 2. Fluxo de Eventos

**Fluxo Principal (pelo usuário)**  
------------------------------------------------------------------  
| Ação do Ator                          | Resposta do Sistema                                  |
|---------------------------------------|------------------------------------------------------|
| 1. Acessar minhas inscrições          | 1. Listar inscrições ativas                           |
| 2. Selecionar evento e “Cancelar”     | 2. Verificar política de cancelamento e confirmar ação|
| 3. Confirmar cancelamento             | 3. Atualizar status da inscrição, liberar vaga e iniciar reembolso (se aplicável) e notificar |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                       | Resposta do Sistema                               |
|-----------------|------------------------------------|---------------------------------------------------|
| 2               | Solicitar cancelamento fora do prazo | Aplicar regra (não permitir ou reembolso parcial) |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção                 | Resposta do Sistema                                     |
|-----------------|-------------------------------------|---------------------------------------------------------|
| 3               | Falha no processo de reembolso      | Marcar reembolso como pendente e notificar suporte      |
| 1               | Inscrição não encontrada            | Exibir erro e instruir usuário a contatar suporte       |

---

## Especificação do Caso de Uso: Gerenciar Vagas

### 1. Identificação
- **Caso de Uso:** Gerenciar Vagas  
- **Atores:** Organizador  
- **Descrição:** Visualizar e ajustar número de vagas, aprovar participantes da fila de espera e gerenciar capacidade do evento.  
- **Pré-condições:** Organizador autenticado e proprietário do evento.  
- **Pós-condições:** Vagas atualizadas; participantes notificados das mudanças.

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator                                | Resposta do Sistema                                      |
|---------------------------------------------|----------------------------------------------------------|
| 1. Acessar painel do evento                  | 1. Exibir status de vagas (totais, ocupadas, lista de espera) |
| 2. Ajustar número de vagas                   | 2. Validar alteração e atualizar vagas_disponíveis       |
| 3. Aprovar participantes da fila de espera   | 3. Mover inscritos da fila para participantes e notificar |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                          | Resposta do Sistema                            |
|-----------------|---------------------------------------|------------------------------------------------|
| 2               | Reduzir vagas abaixo do número inscrito| Solicitar confirmação e oferecer opções (cancelar inscritos ou manter) |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção              | Resposta do Sistema                                           |
|-----------------|----------------------------------|---------------------------------------------------------------|
| 2               | Erro ao atualizar capacidade     | Reverter alteração e notificar organizador com detalhes do erro|

---

## Especificação do Caso de Uso: Gerenciar Pagamento (Transações / Reembolsos)

### 1. Identificação
- **Caso de Uso:** Gerenciar Pagamento  
- **Atores:** Organizador, Sistema de Pagamento (gateway)  
- **Descrição:** Configurar conta de recebimento, visualizar vendas, processar reembolsos e reconciliar transações.  
- **Pré-condições:** Conta do organizador conectada ao gateway (ou método de coleta definido).  
- **Pós-condições:** Transações registradas; reembolsos processados; relatórios financeiros atualizados.

### 2. Fluxo de Eventos

**Fluxo Principal**  
------------------------------------------------------------------  
| Ação do Ator                                | Resposta do Sistema                                      |
|---------------------------------------------|----------------------------------------------------------|
| 1. Conectar conta ao gateway de pagamento   | 1. Autenticar e armazenar credenciais seguras            |
| 2. Visualizar vendas/transações             | 2. Exibir relatório de transações e status               |
| 3. Solicitar reembolso                       | 3. Acionar API do gateway para reembolso e atualizar status|

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                    | Resposta do Sistema                                  |
|-----------------|----------------------------------|------------------------------------------------------|
| 2               | Exportar relatório CSV/PDF       | Gerar e disponibilizar arquivo para download         |
| 1               | Optar por pagamento manual/offline| Registrar método e instruções para pagamentos offline|

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção              | Resposta do Sistema                                           |
|-----------------|----------------------------------|---------------------------------------------------------------|
| 3               | Falha ao processar reembolso     | Marcar reembolso como pendente e notificar suporte            |
| 1               | Credenciais inválidas do gateway | Bloquear integração e exibir instruções de correção           |

---

## Especificação do Caso de Uso: Enviar Notificação

### 1. Identificação
- **Caso de Uso:** Enviar Notificação  
- **Atores:** Sistema (agendador/trigger), Organizador  
- **Descrição:** Enviar comunicações (e-mail, push, SMS) a participantes ou público (confirmações, lembretes, alterações, cancelamentos).  
- **Pré-condições:** Canais de notificação configurados; destinatários com consentimento/opt-in.  
- **Pós-condições:** Notificações enviadas e registros de entrega armazenados.

### 2. Fluxo de Eventos

**Fluxo Principal (automático - lembrete)**  
------------------------------------------------------------------  
| Ação do Ator (Trigger)                  | Resposta do Sistema                                      |
|-----------------------------------------|----------------------------------------------------------|
| 1. Evento atinge trigger (ex.: 24h antes)| 1. Gerar conteúdo com template e selecionar destinatários |
| 2. Enviar notificações                  | 2. Encaminhar via provedores (e-mail/push/SMS) e registrar status |

**Fluxo Principal (manual - pelo organizador)**  
------------------------------------------------------------------  
| Ação do Ator                            | Resposta do Sistema                                      |
|-----------------------------------------|----------------------------------------------------------|
| 1. Compor mensagem e escolher público   | 1. Validar público e preparar envios                     |
| 2. Confirmar envio                      | 2. Disparar envios e registrar entregas                  |

**Fluxos Alternativos**  
------------------------------------------------------------------  
| Etapa Referente | Ação do Ator                            | Resposta do Sistema                            |
|-----------------|-----------------------------------------|------------------------------------------------|
| 1               | Selecionar apenas inscritos ou lista de espera | Enviar somente aos destinatários selecionados  |
| 2               | Preferir canal alternativo (push em vez de e-mail) | Priorizar canal disponível/opt-in             |

**Fluxos de Exceção**  
------------------------------------------------------------------  
| Etapa Referente | Condição de Exceção                 | Resposta do Sistema                                           |
|-----------------|-------------------------------------|---------------------------------------------------------------|
| 2               | Provedor de e-mail/push fora do ar  | Agendar retry e marcar falhas; tentar canais alternativos     |
| 1               | Destinatário opt-out                | Omitir envio e registrar motivo                               |

---

### Observações finais rápidas
- Em vários casos (Cadastrar Evento, Participar, Gerenciar Pagamento) há integração com **API de Mapas** e **Gateway de Pagamento** — trate falhas externas adequadamente e forneça alternativas (entrada manual de endereço, pagamento offline).  
- Em ações concorrentes (e.g., últimas vagas), aplique mecanismos de **reserva temporária** e **reconciliação** para evitar oversell.  
- Regras como prazos de cancelamento, políticas de reembolso e limites de tentativa de login devem ser parametrizáveis.

---

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
