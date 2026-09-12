# ============================================================
# Makefile — etoolstec.com.br (Flutter Web)
# Padrão igual ao front-openerp / back: build-push exige tag;
# deploy assume latest
# ============================================================

PROJECT_NAME = etoolstec_web
FLUTTER = flutter
DART = dart
PUB = flutter pub
GIT = git
MSG ?= "Atualização do projeto $(PROJECT_NAME)"

GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
RED = \033[0;31m
NC = \033[0m

# ============================================================
# DEPLOY OCI — etoolstec.com.br
# ============================================================

DOCKER_USERNAME := rafapasa
IMAGE_TAG       ?= latest
WEB_IMAGE       := $(DOCKER_USERNAME)/etoolstec-web
COMPOSE_WEB     := docker-compose.yml
NO_CACHE        ?=
HOST_PORT       ?= 8090

export IMAGE_TAG
export WEB_IMAGE
export HOST_PORT

.PHONY: help login build-push deploy down restart logs-web ps \
        run-web build-web clean deps analyze format git-up

help: ## Mostra esta ajuda
	@echo "$(BLUE)📋 Comandos — $(PROJECT_NAME)$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-20s$(NC) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(YELLOW)Exemplos:$(NC)"
	@echo "  make build-push IMAGE_TAG=0.1.0"
	@echo "  make deploy"
	@echo "  make deploy IMAGE_TAG=0.1.0"

login: ## docker login no Hub
	docker login -u $(DOCKER_USERNAME)

build-web: ## Build Flutter Web (release)
	@echo "$(BLUE)🌐 flutter build web --release$(NC)"
	$(FLUTTER) build web --release --no-wasm-dry-run
	@test -f build/web/index.html || (echo "$(RED)falhou: build/web/index.html$(NC)"; exit 1)
	@echo "$(GREEN)✅ Build Web em build/web/$(NC)"

build-push: ## flutter build web no host + image nginx linux/arm64 (IMAGE_TAG=x.y.z)
ifeq ($(IMAGE_TAG),latest)
	$(error Use: make build-push IMAGE_TAG=0.1.0 — não pode buildar só latest)
endif
	@$(MAKE) build-web
	@echo "$(BLUE)🐳 Build ARM64 $(WEB_IMAGE):$(IMAGE_TAG) + latest$(NC)"
	DOCKER_BUILDKIT=1 docker build $(NO_CACHE) \
		--platform linux/arm64 \
		-f Dockerfile \
		-t $(WEB_IMAGE):$(IMAGE_TAG) \
		-t $(WEB_IMAGE):latest \
		.
	docker push $(WEB_IMAGE):$(IMAGE_TAG)
	docker push $(WEB_IMAGE):latest
	@echo "$(GREEN)✅ $(WEB_IMAGE):$(IMAGE_TAG) + latest (linux/arm64) no Hub$(NC)"

deploy: ## Sobe etoolstec-web na mcp-network (IMAGE_TAG opcional, default latest)
	@echo "$(BLUE)🚀 Deploy $(WEB_IMAGE):$(IMAGE_TAG) → etoolstec.com.br$(NC)"
	docker network create mcp-network || true
	IMAGE_TAG=$(IMAGE_TAG) WEB_IMAGE=$(WEB_IMAGE) docker compose -f $(COMPOSE_WEB) pull web
	IMAGE_TAG=$(IMAGE_TAG) WEB_IMAGE=$(WEB_IMAGE) docker compose -f $(COMPOSE_WEB) up -d --pull always --no-build web
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep etoolstec-web || true
	@echo "$(GREEN)✅ etoolstec-web no ar$(NC)"

down: ## Para o container
	docker compose -f $(COMPOSE_WEB) down

restart: ## Reinicia o container
	docker compose -f $(COMPOSE_WEB) restart

logs-web: ## Logs do container etoolstec-web
	docker logs -f etoolstec-web --tail=100

ps: ## Status do container
	docker compose -f $(COMPOSE_WEB) ps

run-web: ## Rodar no Chrome
	@echo "$(BLUE)🌐 Rodando no Chrome...$(NC)"
	$(FLUTTER) run -d chrome

deps: ## Instalar dependências
	$(PUB) get

analyze: ## Analisar código
	$(FLUTTER) analyze

format: ## Formatar lib/
	$(DART) format lib/

clean: ## Limpar build Flutter
	$(FLUTTER) clean

git-up: ## Add commit e push
	$(GIT) add .
	$(GIT) commit -m ${MSG}
	$(GIT) push origin main
	@echo "$(GREEN)✅ Alterações enviadas$(NC)"
