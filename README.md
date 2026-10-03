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

### Convenções do modelo

- **Níveis de título:** as atividades ficam dentro do capítulo Produtos e Entregas: cada atividade é uma `\section`, com `\subsection` (Objetivos, Metodologia, Resultados, Conclusão) dentro dela. Cada capítulo mostra automaticamente um sumário local ("Neste capítulo").
- **Figuras e tabelas:** escreva `\caption` **antes** do conteúdo (legenda acima) e `\source{...}` depois (fonte abaixo; vazio gera "Autoria própria."):
  ```latex
  \begin{figure}[H]
      \centering
      \caption{Legenda da figura.}
      \label{fig:M1A1_exemplo}
      \includegraphics[width=0.7\linewidth]{Figuras/M1A1/exemplo.png}
      \source{}
  \end{figure}
  ```
  Referências cruzadas: `\reffig{...}`, `\reftab{...}`, `\refsec{...}`.
- **Destaques:** ambientes `alertbox`, `infobox` e `remarkbox`.
- **Citações:** `\citeonline{chave}` gera "Silva (2024)" e `\cite{chave}` gera "(SILVA, 2024)". A lista de referências só inclui as obras citadas.

Há um exemplo comentado em `M1/M1A1.tex`.

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
