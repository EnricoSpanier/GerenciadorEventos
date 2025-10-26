# GerenciadorEventos

- Documentação no arquivo .tex na pasta documentacao

[Espaço do figma](https://www.figma.com/design/hQo4WzJU1nHs5j3TelntQZ/Sem-t%C3%ADtulo?node-id=0-1&p=f&t=iknWMxae3d7lQNUM-0)

[Diagrama Banco de dados](https://dbdiagram.io/d/GerenciadorEventos-68b640ee777b52b76c91fd34)

[Overleaf](https://www.overleaf.com/read/phbgxdpzfzrq#04f856)

[Drive Diagramas](https://drive.google.com/drive/folders/1yA8NmS_5dP8JDU45GEyJsG6vqcmJiou2?usp=sharing)

[Pesquisa de Artigos](https://ieeexplore.ieee.org/Xplore/home.jsp)

[DBForgeStudio](https://www.devart.com/dbforge/mysql/studio/)


## 🚀 Containers (Docker) — Guia Rápido
Para instruções completas, veja `Projeto/README.md`.

Comandos principais (rodar a partir da raiz deste repositório):

```bash
# subir tudo e (re)construir imagens
docker compose -f Projeto/docker-compose.yml up -d --build

# verificar status
docker compose -f Projeto/docker-compose.yml ps

# parar containers (mantém rede/volumes)
docker compose -f Projeto/docker-compose.yml stop

# derrubar (remove containers e rede)
docker compose -f Projeto/docker-compose.yml down

# derrubar removendo volume de dados do Postgres (limpa banco)
docker compose -f Projeto/docker-compose.yml down -v
```

URLs e portas:
- Frontend: http://localhost:8088
- Backend: http://localhost:8081
- Postgres (host): localhost:5433 (interno: db:5432)

Credenciais/variáveis:
- Arquivo `.env` em `Projeto/.env` (não versionado). Peça no grupo/time.

