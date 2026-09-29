# Resumo da Arquitetura de Layouts

## 1. `BaseLayout.astro` (A Raiz do Projeto)

* **Função:** Esqueleto HTML cru e global (`<!doctype html>`, `<head>`, `<body>`).
* **O que resolve:**
* Configura SEO, metatags cruciais (`viewport`) e fontes globais.
* Define o contentor principal com `min-h-[100dvh] flex flex-col` para controlar a altura do ecrã.
* Elimina falhas de *scroll* horizontal (`overflow-x-hidden`) e garante acessibilidade (*skip link* para leitores de ecrã).



---

## 2. Layouts Derivados (ex: `NotCustomerLayout.astro`)

* **Função:** A "moldura visual" que consome o `BaseLayout`.
* **O que resolve:**
* Organiza a estrutura clássica de interface: **Header + Main + Footer**.
* Aplica a classe **`flex-1`** na tag `<main>`, garantindo que o rodapé fique sempre fixo no fundo do ecrã, independentemente da quantidade de conteúdo.



---

## 3. `BaseSection.astro` (O Bloco de Conteúdo)

* **Função:** Componente base para padronizar qualquer secção da página.
* **O que resolve:**
* Padroniza limites de largura (`max-w-7xl`), espaçamentos internos e temas de fundo (`bg`).
* Oferece a prop **`fullScreen={true}`** (`min-h-dvh`) para criar secções que ocupam o tamanho exato do ecrã com alinhamento vertical centralizado.
* Usa altura mínima (`min-h`) em vez de altura fixa (`h`), impedindo que o conteúdo transborde ou quebre em ecrãs pequenos.