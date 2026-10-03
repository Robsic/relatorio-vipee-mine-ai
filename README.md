# Relatório Técnico: VIPEE-Mine AI

Código-fonte em LaTeX do relatório técnico do projeto **VIPEE-Mine AI**, desenvolvido pelas instituições **Universidade Federal de Itajubá (UNIFEI)**, *Campus* Itabira, **Universidade Federal de Lavras (UFLA)** e **Universidade Estadual de Campinas (UNICAMP)**, em parceria com as empresas **Stellantis Automóveis Brasil Ltda.**, **Vale S.A.**, **Pagano Software Solutions** e **Tricod Equipamentos Eletrônicos Indústria e Comércio Ltda.**

## 🗂 Estrutura

- `0_relatorio_vipee.tex`: arquivo principal (é o que deve ser compilado); preâmbulo e ordem das seções.
- `1_Capa.tex`: capa e folha de rosto (instituições, empresas, coordenadores).
- `2_Resumo.tex`: resumo e palavras-chave.
- `3_Introducao.tex`: introdução.
- `4_Justificativa.tex`: justificativa.
- `5_Objetivos.tex`: objetivos gerais e específicos.
- `6_Produtos_entregas.tex`: quadro-resumo de produtos/entregas e importação das atividades.
- `M<n>/M<n>A<m>.tex`: uma atividade por arquivo (ex.: `M1/M1A1.tex`).
- `7_Conclusao.tex`: conclusão.
- `8_Referencias.tex` / `Referencias.bib`: bibliografia (ABNT, via `abntex2cite`).
- `9_Contracapa.tex`: contracapa com os logos dos parceiros (que também aparecem no rodapé da folha de rosto). Cada logo é lido de `Logos/<nome>.{pdf,png,jpg,eps}` (`ufla`, `unicamp`, `stellantis`, `vale`, `pagano`, `tricod`); sem o arquivo, sai o nome do parceiro em texto.
- `apostila.sty`: modelo visual (fontes, cores, cabeçalhos, capítulos, legendas, caixas de destaque).
- `cover.jpg`, `Logos/`, `Fontes/`: fundo da capa, logos e fontes usados pelo modelo.
- `Figuras/`: imagens do relatório (crie uma subpasta por atividade).
- Logo do projeto na capa: macro `\logoprojeto` no arquivo principal (`Logos/vipee_logo.png`).

## ✍️ Como contribuir com uma atividade

1. Copie `M1/M1A1.tex` para `M<n>/M<n>A<m>.tex` e ajuste título e `\label`.
2. Importe o arquivo no final de `6_Produtos_entregas.tex`:
   ```latex
   \import{M1/}{M1A2}
   ```
3. Adicione uma linha no Quadro de Produtos e Entregas (`6_Produtos_entregas.tex`).
4. Coloque as imagens em `Figuras/M<n>A<m>/` e cadastre as referências em `Referencias.bib`.

Há um exemplo comentado em `M1/M1A1.tex`.

## 🧰 Comandos do modelo

### Níveis de título

As atividades ficam dentro do capítulo Produtos e Entregas: cada atividade é uma `\section`, com `\subsection` (Objetivos, Metodologia, Resultados, Conclusão) dentro dela. Cada capítulo mostra automaticamente um sumário local ("Neste capítulo"); não é preciso chamar nada.

### Figuras e tabelas

Escreva `\caption` **antes** do conteúdo (legenda acima, como pede a ABNT) e `\source{...}` **depois** (fonte abaixo):

```latex
\begin{figure}[H]
    \centering
    \caption{Arquitetura do sistema de visão surround.}
    \label{fig:M1A1_arquitetura}
    \includegraphics[width=0.7\linewidth]{Figuras/M1A1/arquitetura.png}
    \source{Elaborado pelos autores}
\end{figure}
```

- `\source{}` vazio gera "Fonte: Autoria própria."; o ponto final é acrescentado se faltar.
- Em figuras, a linha "Fonte:" alinha com a borda esquerda da imagem; em tabelas e quadros, com a margem do texto.
- **Tabela** (dados numéricos, bordas laterais abertas): `table`, de preferência com `\toprule`, `\midrule` e `\bottomrule`, do `booktabs`.
- **Quadro** (texto, todas as bordas fechadas): `quadro`, no mesmo formato de `figure`/`table`. Para quadros que podem quebrar de página, use `quadrolongo`, com a mesma sintaxe do `longtable` (veja o Quadro de Produtos e Entregas em `6_Produtos_entregas.tex`).

**Numeração (ABNT):** cada tipo tem numeração própria (Figura, Quadro, Tabela, Código e equações), arábica e sequencial no documento inteiro, sem o número do capítulo: Figura 1, Figura 2, Quadro 1, Tabela 1... É automático.

As listas de cada tipo podem ser incluídas no arquivo principal, logo após o `\tableofcontents`: `\listoffigures`, `\listoftables`, `\listofquadros` e `\lstlistoflistings` (Lista de Códigos).

### Referências cruzadas

Geram o nome do elemento, o número e (para divisões do texto) o título, já com link e na cor do modelo. O rótulo vem logo depois do comando de título ou do `\caption`.

| Comando | Gera | Use com |
|---|---|---|
| `\refcap{rotulo}` | Capítulo 4 - Produtos e entregas | `\chapter{...}\label{rotulo}` |
| `\refsec{rotulo}` | Seção 4.1 - M1A1 | `\section{...}\label{rotulo}` |
| `\refssc{rotulo}` | Subseção 4.1.1 - Objetivos | `\subsection{...}\label{rotulo}` |
| `\refsss{rotulo}` | Subsubseção 4.1.1.1 - ... | `\subsubsection{...}\label{rotulo}` |
| `\reffig{rotulo}` | Figura 1 | `figure` |
| `\reftab{rotulo}` | Tabela 1 | `table` |
| `\refqdr{rotulo}` | Quadro 1 | `quadro`, `quadrolongo` |
| `\refcod{rotulo}` | Código 1 | `lstlisting` (`label={rotulo}`) |
| `\refapn{rotulo}` / `\refanx{rotulo}` | Apêndice A / Anexo A | apêndices e anexos |

Use prefixos com o código da atividade (`fig:M1A1_...`, `tab:M2A3_...`) para não haver rótulos repetidos entre colaboradores.

### Caixas de destaque

```latex
\begin{alertbox}                  % título padrão: "Importante!"
    Texto do alerta.
\end{alertbox}

\begin{alertbox}{Atenção!}        % título personalizado, entre chaves
    Texto do alerta.
\end{alertbox}

\begin{infobox}                   % caixa azul-clara, sem título
    Informação complementar.
\end{infobox}

\begin{remarkbox}                 % caixa azul-acinzentada, sem título
    Observação.
\end{remarkbox}
```

As três aceitam opções do `tcolorbox` entre colchetes, por exemplo `\begin{infobox}[colback=white]`.

### Código-fonte

```latex
Trecho em linha: \code{rclpy.spin(node)}.

\begin{lstlisting}[caption={Inicialização do nó ROS 2}, label={lst:M1A1_no}]
def main():
    rclpy.init()
\end{lstlisting}

\begin{lstlisting}[language=C++, caption={Exemplo em C++}]
int main() { return 0; }
\end{lstlisting}
```

A linguagem padrão é Python; troque com `language=` (qualquer linguagem do pacote `listings`). A legenda sai como "Código 1".

### Citações (ABNT, `abntex2cite`)

| Comando | Gera |
|---|---|
| `\cite{silva2024}` | (Silva, 2024) |
| `\cite[p.~10]{silva2024}` | (Silva, 2024, p. 10) |
| `\citeonline{silva2024}` | Silva (2024) |
| `\apud{silva2024}{souza2020}` | (Silva, 2024 apud Souza, 2020) |
| dois autores: `\cite{...}` / `\citeonline{...}` | (Clarac; Bonnin, 1985) / Clarac e Bonnin (1985) |
| três autores | (Costa; Mendes; Andrade, 2017) / Costa, Mendes e Andrade (2017) |
| quatro ou mais autores | (Souza *et al.*, 2020) / Souza *et al.* (2020) |
| várias obras: `\cite{costa2017,souza2020}` | (Costa; Mendes; Andrade, 2017; Souza *et al.*, 2020) |

As citações seguem a NBR 10520:2023: nome do autor em caixa alta e baixa também dentro dos parênteses (§6.1.1.1), autores separados por ponto e vírgula entre parênteses e *et al.* em itálico a partir de quatro autores (§6.1.2). Na lista de referências, o sobrenome continua em maiúsculas ("SILVA, J.") e constam todos os autores, como manda a NBR 6023.

Cadastre as obras em `Referencias.bib`. A lista de referências só inclui as obras citadas. **Não remova** a entrada `vipee-abnt-options` no topo do arquivo: ela não é uma referência, é o que ativa o formato de citação de 2023.

### Pendências

`\todo[inline]{Texto}` gera uma nota laranja no corpo do texto, útil durante a escrita. Use sempre com `[inline]`, porque a margem do modelo é estreita demais para notas laterais. Remova as notas antes da entrega.

### Outros

- `\textbf{...}` sai em negrito **e** na cor azul do modelo. Para negrito preto, use `{\bfseries ...}`.
- `\neverindent` desliga o recuo de primeira linha dos parágrafos seguintes; `\autoindent` o restaura.
- No arquivo principal: `\logoprojeto` define o logo da capa e dos cabeçalhos; `\logoparceiro` monta os logos da folha de rosto e da contracapa (ver comentários no preâmbulo).

## 🛠 Pré-requisitos

Distribuição LaTeX completa e atualizada ([TeX Live](https://www.tug.org/texlive/) ou [MacTeX](https://www.tug.org/mactex/)) com:
- `xelatex`;
- `latexmk`;
- pacotes `abntex2`, `tcolorbox`, `etoc`, `background`, `fontawesome5`, entre outros da distribuição;
- Ghostscript (o XeLaTeX o usa para converter os logos `.eps`).

As fontes (Heuristica, Source Sans 3, Source Code Pro, Cinzel, EB Garamond) já estão em `Fontes/`.

## 🚀 Como compilar

O `.latexmkrc` já configura XeLaTeX e o arquivo principal. Na raiz do repositório:

```bash
latexmk          # gera 0_relatorio_vipee.pdf
latexmk -pvc     # modo contínuo: recompila ao salvar (Ctrl+C para sair)
latexmk -c       # remove arquivos auxiliares
latexmk -C       # remove auxiliares e o PDF
```

## 👥 Equipe

**Elaborado pela equipe UNIFEI, UFLA e UNICAMP**
- **Coordenador Geral e Coordenador UNIFEI**: Prof. Dr. Giovani Bernardes Vitor
- **Coordenador UFLA**: Prof. Dr. Danton Diego Ferreira
- **Coordenador UNICAMP**: Prof. Dr. Janito Vaqueiro Ferreira

## 📄 Modelo

Formatação baseada no modelo de apostila do RobSIC/Unifei (`apostila.sty`).
