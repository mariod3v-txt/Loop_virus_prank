# VBA Office Macro — Security PoC

> **Proof of Concept (PoC) para análise de segurança de macros VBA em ambiente controlado.**

## ⚠️ Aviso

Este projeto foi desenvolvido exclusivamente para **testes de segurança, aprendizado e validação em ambiente autorizado**.

A PoC demonstra como uma macro VBA pode interagir com o sistema operacional e iniciar processos externos. Ela **não deve ser executada em computadores de terceiros ou em ambientes sem autorização**.

Recomenda-se utilizar uma **máquina virtual isolada** para reprodução dos testes.

---

## 🎯 Objetivo

O objetivo desta PoC é demonstrar o potencial de abuso de macros VBA em documentos do Microsoft Office.

Durante o teste, a macro demonstra uma cadeia simplificada:

```text
Microsoft Office
       │
       ▼
     VBA
       │
       ├── Criação de arquivo .BAT
       │
       ├── Execução de processo externo
       │
       └── Execução de aplicações do Windows
```

A finalidade é permitir que equipes de segurança avaliem controles preventivos e mecanismos de detecção relacionados à execução de macros.

---

## 🧪 Funcionalidades da PoC

A implementação demonstra:

* execução de uma macro VBA;
* obtenção do diretório do usuário através do ambiente do Windows;
* criação de um arquivo `.bat`;
* escrita de comandos no arquivo criado;
* execução do arquivo através do VBA;
* inicialização de processos externos;
* execução de comandos através do `Shell`;
* geração de uma demonstração visual através de `UserForm`;
* mecanismo de encerramento da demonstração.

---

## 📂 Estrutura

```text
.
├── README.md
├── VBA_PoC.bas
└── screenshots/
    ├── macro.png
    ├── poc_execution.png
    └── process_tree.png
```

---

## 🔬 Exemplo de fluxo

A execução controlada pode ser representada da seguinte maneira:

```text
Excel
  │
  ▼
Macro VBA
  │
  ├──────────────► UserForm / demonstração visual
  │
  ├──────────────► criação de POC.BAT
  │                      │
  │                      ▼
  │                 processos do Windows
  │
  └──────────────► processo externo
```

---

## 🛡️ Relevância para segurança

Macros VBA podem representar um vetor de ataque quando políticas de segurança permitem a execução de macros não confiáveis.

Em um cenário real, um documento malicioso poderia utilizar técnicas semelhantes como etapa inicial de uma cadeia de ataque.

O impacto real dependeria de fatores como:

* políticas de execução de macros;
* origem do documento;
* privilégios do usuário;
* controles de endpoint;
* EDR/antivírus;
* políticas de PowerShell;
* segmentação de rede;
* mecanismos de logging e monitoramento.

Esta PoC **não demonstra comprometimento completo de um endpoint**. Ela demonstra apenas a capacidade de execução e interação com o sistema operacional.

---

## 🧰 Ambiente recomendado

Para reprodução:

```text
Windows 10/11
Microsoft Office
Máquina virtual
Snapshot antes dos testes
Ambiente autorizado
```

Recomenda-se manter a VM isolada e utilizar arquivos de teste.

---

## 📊 Evidências

Durante uma avaliação de segurança, recomenda-se registrar:

* configuração de segurança do Office;
* comportamento apresentado ao abrir o documento;
* processos criados;
* relação entre processos pai/filho;
* eventos registrados pelo Windows;
* alertas gerados pelo EDR/antivírus;
* arquivos criados pela PoC.

Exemplo de árvore de processos:

```text
EXCEL.EXE
    └── processo externo
```

---

## 🔐 Mitigações recomendadas

Como medidas defensivas, recomenda-se avaliar:

1. Bloqueio de macros provenientes da Internet.
2. Uso de macros assinadas digitalmente quando necessário.
3. Restrição da execução de macros não confiáveis.
4. Monitoramento de processos iniciados por aplicativos Office.
5. Monitoramento de comportamentos anômalos envolvendo PowerShell e outros interpretadores.
6. Princípio do menor privilégio.
7. Atualização do Microsoft Office e do sistema operacional.
8. Capacitação dos usuários para identificar documentos suspeitos.

---

## ⚠️ Limitações

Esta PoC foi desenvolvida para demonstrar um comportamento específico e **não representa um malware completo**.

Não são objetivos deste projeto:

* persistência;
* evasão de antivírus/EDR;
* roubo de credenciais;
* exfiltração de dados;
* criptografia de arquivos;
* propagação pela rede;
* comprometimento de outros dispositivos.

---

## 📜 Uso responsável

Utilize este projeto somente em sistemas próprios ou em ambientes para os quais você tenha autorização explícita para realizar testes.

O autor não se responsabiliza pelo uso indevido deste material.

---

## 👤 Contexto

Projeto desenvolvido como estudo prático de **VBA, segurança de aplicações Office e análise de superfícies de ataque relacionadas a macros**.

A PoC foi desenvolvida com finalidade educacional e de validação de controles de segurança.
