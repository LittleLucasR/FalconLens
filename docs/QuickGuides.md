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
* Mantém a secção a ocupar toda a largura, centraliza o conteúdo verticalmente e aplica `overflow-hidden`.
* Por padrão, envolve o conteúdo num contêiner responsivo com `px-4 sm:px-6 lg:px-8` e largura máxima `max-w-7xl`.
* Usa espaçamento vertical responsivo (`py-16 md:py-24`) ou, com **`fullScreen={true}`**, altura mínima `min-h-dvh` e `py-12`.
* Usa altura mínima (`min-h`) em vez de altura fixa (`h`), impedindo que o conteúdo transborde ou quebre em ecrãs pequenos.

### Props

| Prop | Valores | Padrão | Finalidade |
| --- | --- | --- | --- |
| `id` | `string` | — | Define o identificador HTML da secção. |
| `class` | `string` | `''` | Adiciona classes Tailwind à secção exterior. |
| `fullScreen` | `boolean` | `false` | Define `min-h-dvh` para uma secção com, no mínimo, a altura do ecrã. |
| `useContainer` | `boolean` | `true` | Controla se o conteúdo é envolvido pelo contêiner responsivo. |
| `containerVariant` | `narrow`, `default`, `wide`, `full` | `wide` | Define a largura máxima do contêiner: `max-w-3xl`, `max-w-5xl`, `max-w-7xl` ou `max-w-full`. |
| `bg` | `default`, `muted`, `dark`, `brand` | `default` | Aplica o tema de fundo e texto: branco, cinza, escuro ou azul de marca. |

### Exemplo

```astro
<BaseSection id="hero" fullScreen bg="dark">
	<h1>Conteúdo da secção</h1>
</BaseSection>
```

Para ocupar toda a largura sem o contêiner interno, use `useContainer={false}`. Nesse caso, o conteúdo também deixa de receber automaticamente o `px-4 sm:px-6 lg:px-8`.